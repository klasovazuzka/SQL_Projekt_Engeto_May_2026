--Náhled primární tabulky--
SELECT * 
FROM t_zuzana_klasova_project_SQL_primary_final;
-------------------------------------------------------------
--1.Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?--
WITH unique_wages AS (
    -- 1. Krok: Nejprve získám data pro každý rok a odvětví --
    SELECT 
        year,
        industry_branch,
        avg_wage
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE industry_branch IS NOT NULL
    GROUP BY year, industry_branch, avg_wage
),
wage_trends AS (
    -- 2. Krok: Spočítám loňskou mzdu pomocí fce LAG --
    SELECT 
        year,
        industry_branch,
        avg_wage,
        LAG(avg_wage) OVER (PARTITION BY industry_branch ORDER BY year) AS prev_year_wage
    FROM unique_wages
)
-- 3. Krok: Výpočet rozdílů a určení trendu --
-- použiji fci numeric (: : + přetypovací typ) pro přesná čísla s pevnou desetinnou čárkou -- 
SELECT 
    year AS rok,
    industry_branch AS odvetvi,
    ROUND(avg_wage::numeric, 0) AS prumerna_mzda,
    ROUND(prev_year_wage::numeric, 0) AS mzda_predchozi_rok,
    ROUND((avg_wage - prev_year_wage)::numeric, 0) AS rozdil_v_kc,
    CASE 
        WHEN prev_year_wage IS NULL THEN 'První rok v datech'
        WHEN avg_wage > prev_year_wage THEN 'Růst'
        WHEN avg_wage < prev_year_wage THEN 'Pokles'
        ELSE 'Beze změny'
    END AS trend
FROM wage_trends
ORDER BY odvetvi, rok;
-------------------------------------------------------------------------------------------------------------------------
-- Díky řazení ORDER BY mezirocni_rozdil_czk ASC vidím ihned největší propady v historii odvětví měřených dat --

WITH annual_wages AS (
    SELECT DISTINCT 
        year,
        industry_branch,
        avg_wage
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE industry_branch IS NOT NULL
),
lagged_wages AS (
    SELECT 
        year,
        industry_branch,
        avg_wage AS mzda_aktualni_rok,
        LAG(avg_wage) OVER (PARTITION BY industry_branch ORDER BY year) AS mzda_predchozi_rok
    FROM annual_wages
)
SELECT 
    year AS rok,
    industry_branch AS odvetvi,
    mzda_predchozi_rok,
    mzda_aktualni_rok,
    (mzda_aktualni_rok - mzda_predchozi_rok) AS mezirocni_rozdil_czk
FROM lagged_wages
WHERE (mzda_aktualni_rok - mzda_predchozi_rok) < 0  -- Filtruji pouze poklesy --
ORDER BY mezirocni_rozdil_czk ASC;
