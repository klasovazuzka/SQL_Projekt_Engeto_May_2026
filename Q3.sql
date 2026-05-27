-- 3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? --

WITH price_trends AS (
    -- 1. Krok: Ke každé potravině a roku si pomocí funkce LAG() přiřadím cenu z předchozího roku --
    SELECT 
        year,
        food_category,
        avg_price,
        LAG(avg_price) OVER (PARTITION BY food_category ORDER BY year) AS prev_year_price
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE avg_price IS NOT NULL
    -- Odeberu případné duplicity --
    GROUP BY year, food_category, avg_price
)
-- 2. Krok: Vypočítám procentuální nárůst a udělám z něj průměr za celé období --
SELECT 
    food_category AS potravina,
    -- Výpočet procent: ((aktuální cena - loňská cena) / loňská cena) * 100
    -- použiji opět ::numeric --
    ROUND(AVG(((avg_price - prev_year_price) / prev_year_price) * 100)::numeric, 2) AS prumerny_mezirocni_narust_v_procentech
FROM price_trends
-- Vyfiltruji první roky, protože u nich nemám loňskou cenu k porovnání --
WHERE prev_year_price IS NOT NULL
GROUP BY food_category
-- Seřadím od nejnižší hodnoty po nejvyšší (ASC), takže nejpomaleji zdražující budou nahoře (ASC řazení SQL dělá i defaultně)
ORDER BY prumerny_mezirocni_narust_v_procentech ASC;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Stejné SQL řešení s CASE navíc na přidaný sloupec Zdražuje/Zlevňuje/Cena se nemění)--

WITH price_trends AS (
    -- 1. Krok: Ceny s loňskou hodnotou (stejné jako v předchozím řešení) --
    SELECT 
        year,
        food_category,
        avg_price,
        LAG(avg_price) OVER (PARTITION BY food_category ORDER BY year) AS prev_year_price
    FROM t_zuzana_klasova_project_sql_primary_final
    WHERE avg_price IS NOT NULL
    GROUP BY year, food_category, avg_price
),
percentage_growth AS (
    -- 2. Krok: Zde pouze spočítám procenta --
    SELECT 
        food_category AS potravina,
        ROUND(AVG(((avg_price - prev_year_price) / prev_year_price) * 100)::numeric, 2) AS prumerny_narust
    FROM price_trends
    WHERE prev_year_price IS NOT NULL
    GROUP BY food_category
)
-- 3. Krok: Přidám sloupec Zdražuje/Zlevňuje/Cena se nemění pomocí CASE --
SELECT 
    potravina,
    prumerny_narust,
    CASE 
        WHEN prumerny_narust > 0 THEN 'Zdražuje'
        WHEN prumerny_narust < 0 THEN 'Zlevňuje'
        ELSE 'Cena se nemění'
    END AS cenovy_trend
FROM percentage_growth
ORDER BY prumerny_narust ASC;
