🗂 Datové podklady
Pro vypracování analýzy byly využity sady z Portálu otevřených dat ČR a další globální databáze.

Primární tabulky
czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období.

czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.

czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.

czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.

czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.

czechia_price – Informace o cenách vybraných potravin za několikaleté období.

czechia_price_category – Číselník kategorií potravin, které se vyskytují v přehledu.  

Číselníky sdílených informací o ČR
czechia_region – Číselník krajů ČR dle normy CZ-NUTS 2.  

czechia_district – Číselník okresů ČR dle normy LAU.  

Dodatečné tabulky
countries – Geografické a kulturní informace o zemích (hlavní město, měna, národní jídlo, průměrná výška populace).  

economies – Makroekonomické ukazatele (HDP, GINI, daňová zátěž) pro daný stát a rok.  

🎯 Výstupy projektu
Výstupem analýzy je sada SQL skriptů a dvě finální databázové tabulky sloužící jako podklad pro zodpovězení výzkumných otázek:  

t_{jmeno}_{prijmeni}_project_SQL_primary_final – Sjednocená data mezd a cen potravin za ČR za totožné porovnatelné období (společné roky).

t_{jmeno}_{prijmeni}_project_SQL_secondary_final – Dodatečná makroekonomická data o dalších evropských státech.

📊 Výzkumné otázky a závěry analýzy
1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Při pouhém srovnání počátečního roku 2007 a konečného roku 2018 průměrné mzdy vzrostly plošně. Zaměříme-li se však na detailní meziroční vývoj, růst nebyl nepřetržitý. V dlouhodobém horizontu byla řada odvětví (zejména finanční sektor, energetika a těžký průmysl) zasažena ekonomickými výkyvy.

Nejvýraznější propady v datech:

Peněžnictví a pojišťovnictví: Největší propad v roce 2008 o 12 271 Kč (z 54 059 Kč na 41 788 Kč). Další poklesy přišly v letech 2010 a 2013.

Energetika: Výroba a rozvod elektřiny, plynu atd. zaznamenala propad o 11 397 Kč v roce 2012.

Těžba a dobývání: Opakované poklesy, nejvýraznější v roce 2009 (o 9 579 Kč) a 2008 (o 9 391 Kč).

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období?
Během sledovaného období (2006–2018) se celková kupní síla zlepšila. Ačkoliv absolutní ceny obou komodit vzrostly, průměrná mzda stoupala rychlejším tempem.

Zlepšení kupní síly (2006 vs. 2018):
V roce 2018 si průměrně vydělávající občan mohl ze své výplaty koupit o 52 kg chleba (celkem 1 365 kg) a o 204 litrů mléka (celkem 1 670 l) více než na začátku období.

3. Která kategorie potravin zdražuje nejpomaleji?
Na základě dat je u jedné z kategorií nárůst téměř zanedbatelný.

Vítěz kategorie: Nejpomaleji zdražuje vepřová pečeně s kostí, u níž činí průměrný meziroční nárůst ceny pouze 0,1 %.

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Neexistuje. Ve sledovaném období (2007–2018) k takto dramatickému skokovému rozdílu nedošlo.

Největší zaznamenaný rozdíl: Rok 2013, kdy ceny rostly o 7,11 % rychleji než mzdy, nicméně desetiprocentní hranice překročena nebyla.

5. Má výška HDP vliv na změny ve mzdách a cenách potravin?
Ano, vliv je prokazatelný, ale vztah není striktně lineární a působí zde i další makroekonomické faktory. Při výrazných ekonomických šocích se vliv projevuje téměř okamžitě.

Ekonomický propad (2009): Razantní pokles HDP (-4,66 %) okamžitě korespondoval se zlevněním potravin (-6,81 %) a razantním zpomalením růstu mezd (spadly ze 7 % na 3,07 %).

Silný růst (2017): Růst HDP o 5,17 % byl provázen prudkým nárůstem cen potravin (téměř 10 %) i rychlejším růstem mezd (6,17 %).

Výjimka z pravidla (2015): Ačkoliv HDP rostlo významným tempem (5,39 %), ceny potravin mírně klesly (-0,56 %) a mzdy rostly jen velmi pozvolna (2,6 %).

Závěr: Růst HDP zpravidla vytváří prostor pro růst mezd a cen, ale nemusí se to nutně a v plné síle projevit ve stejném nebo bezprostředně následujícím roce.
