Úvod do projektu:

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.
Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.
Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

Primární tabulky:
czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

Číselníky sdílených informací o ČR:
czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
czechia_district – Číselník okresů České republiky dle normy LAU.

Dodatečné tabulky:
countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
economies – HDP, GINI, daňová zátěž atd. pro daný stát a rok.

Výstup projektu
Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte t_{jmeno}{prijmeni}project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a t{jmeno}{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech). Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Výzkumné otázky:
1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Odpovědi:

1)

2) Během sledovaného období (r. 2006–2018) se celková kupní síla a dostupnost obou základních potravin zlepšila. Ačkoliv absolutní ceny chleba i mléka vzrostly, průměrná mzda stoupala rychlejším tempem. Díky tomu si průměrně vydělávající občan mohl v roce 2018 ze své výplaty koupit o 52 kg chleba (celkem 1 365 kg) a o 204 litrů mléka (celkem 1 670 l) více než na začátku srovnatelného období v roce 2006.

3) Na základě provedené analýzy dat je kategorií potravin, která zdražuje nejpomaleji, vepřová pečeně s kostí, u níž je průměrný meziroční nárůst ceny jen 0,1 %.

4) Na základě analyzovaných dat neexistuje ve sledovaném období (r.2007–2018) žádný rok, ve kterém by meziroční nárůst cen potravin převýšil růst mezd o více než 10 %. Největší rozdíl byl zaznamenán v roce 2013, kdy ceny rostly o 7,11 % rychleji než mzdy, ale ani zde nebyla desetiprocentní hranice překročena.

5)
Výrazný pokles HDP v roce 2009 (o -4,66 %) se okamžitě projevil propadem cen potravin (o -6,81 %) a zpomalením růstu mezd (spadly z více než 7% růstu v předchozích letech na 3,07 %).
Výrazný růst HDP v roce 2017 (5,17 %) byl provázen silným nárůstem cen potravin (9,98 %) a růstem mezd (6,17 %), který pak ještě akceleroval v roce 2018 na 7,7 %.
Ukazuje se, že HDP není jediným hybatelem. V roce 2015 HDP rostlo velmi rychle (5,39 %), ale ceny potravin naopak klesaly (-0,56 %) a růst mezd byl spíše mírný (2,6 %).

Na základě analyzovaných dat lze konstatovat, že vývoj HDP má prokazatelný vliv na změny mezd a cen potravin, nicméně tento vztah není striktně lineární a působí zde i další faktory.

Při výrazných ekonomických šocích se vliv projevuje téměř okamžitě. Příkladem je rok 2009, kdy razantní propad HDP (-4,66 %) korespondoval s výrazným zlevněním potravin (-6,81 %) a zpomalením růstu mezd. Stejně tak v období silného růstu v roce 2017 (růst HDP o 5,17 %) vidíme souběžný prudký nárůst cen potravin (téměř 10 %) i rychlejší růst mezd (6,17 %).

Na druhou stranu data obsahují i výjimky, jako například rok 2015, kdy HDP rostlo významným tempem (5,39 %), avšak ceny potravin ve stejném roce mírně klesly a mzdy rostly pouze pozvolna. Růst HDP tedy zpravidla vytváří prostor pro růst mezd a cen, ale nemusí se to nutně a v plné síle projevit ve stejném nebo bezprostředně následujícím roce.
