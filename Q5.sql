-- Náhled sekundární tabulky --
SELECT *
FROM t_zuzana_klasova_project_sql_secondary_final;
---------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem? --

WITH gdp_growth AS (
    -- Meziroční růst HDP pro Českou republiku ze sekundární tabulky --
    SELECT 
        year,
        gdp,
        ROUND( ((gdp - LAG(gdp) OVER (ORDER BY year)) / LAG(gdp) OVER (ORDER BY year) * 100)::numeric, 2 ) AS gdp_growth_percent
    FROM t_zuzana_klasova_project_sql_secondary_final
    WHERE country_countries = 'Czech Republic'
),
wage_growth AS (
    -- Meziroční růst průměrných mezd z primární tabulky --
    SELECT 
        year,
        ROUND( AVG(avg_wage)::numeric, 2 ) AS avg_yearly_wage,
        ROUND( ((AVG(avg_wage) - LAG(AVG(avg_wage)) OVER (ORDER BY year)) / LAG(AVG(avg_wage)) OVER (ORDER BY year) * 100)::numeric, 2 ) AS wage_growth_percent
    FROM t_zuzana_klasova_project_sql_primary_final
    GROUP BY year
),
price_growth AS (
    -- Meziroční růst průměrných cen potravin z primární tabulky --
    SELECT 
        year,
        ROUND( AVG(avg_price)::numeric, 2 ) AS avg_yearly_price,
        ROUND( ((AVG(avg_price) - LAG(AVG(avg_price)) OVER (ORDER BY year)) / LAG(AVG(avg_price)) OVER (ORDER BY year) * 100)::numeric, 2 ) AS price_growth_percent
    FROM t_zuzana_klasova_project_sql_primary_final
    GROUP BY year
)
-- JOIN všech tří metrik přes rok --
SELECT 
    g.year,
    g.gdp_growth_percent,
    w.wage_growth_percent,
    p.price_growth_percent
FROM gdp_growth g
JOIN wage_growth w ON g.year = w.year
JOIN price_growth p ON g.year = p.year
WHERE g.gdp_growth_percent IS NOT NULL
ORDER BY g.year;
