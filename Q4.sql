-- 4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? --

WITH yearly_averages AS (
    -- 1. Krok: Nejdříve potřebuji z mé tabulky spočítat průměrnou mzdu a cenu za celou ČR pro každý rok --
    -- Zprůměruji tedy odvětví a kategorie potravin dohromady --
    SELECT 
        year,
        AVG(avg_wage) AS avg_yearly_wage,
        AVG(avg_price) AS avg_yearly_price
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE avg_wage IS NOT NULL AND avg_price IS NOT NULL
    GROUP BY year
),
yearly_lags AS (
    -- 2. Krok: Ke každému roku si pomocí fce LAG () připojím hodnoty z roku předchozího --
    -- Tady už nepotřebuji PARTITION BY, protože mám jen jeden řádek pro každý rok --
    SELECT 
        year,
        avg_yearly_wage,
        LAG(avg_yearly_wage) OVER (ORDER BY year) AS prev_year_wage,
        avg_yearly_price,
        LAG(avg_yearly_price) OVER (ORDER BY year) AS prev_year_price
    FROM yearly_averages
),
growth_calc AS (
    -- 3. Krok: Spočítám procentuální nárůst pro mzdy i ceny --
-- Opět použiji numeric -- 
    SELECT 
        year,
        ROUND(((avg_yearly_wage - prev_year_wage) / prev_year_wage * 100)::numeric, 2) AS wage_growth_pct,
        ROUND(((avg_yearly_price - prev_year_price) / prev_year_price * 100)::numeric, 2) AS price_growth_pct
    FROM yearly_lags
    -- Vyfiltruji první rok, kde nemám data k porovnání --
    WHERE prev_year_wage IS NOT NULL AND prev_year_price IS NOT NULL
)
-- 4. Krok:Od růstu cen odečtu růst mezd --
SELECT 
    year AS rok,
    wage_growth_pct AS rust_mezd_v_procentech,
    price_growth_pct AS rust_cen_v_procentech,
    -- Odečtu dvě procentuální hodnoty od sebe --
    (price_growth_pct - wage_growth_pct) AS rozdil_v_procentech,
    -- Přidám textový sloupec ANO/NE s fcí CASE
    CASE 
        WHEN (price_growth_pct - wage_growth_pct) > 10 THEN 'Ano (rozdíl > 10 %)'
        ELSE 'Ne'
    END AS rust_cen_vyssi_o_10_procent
FROM growth_calc
ORDER BY year;
