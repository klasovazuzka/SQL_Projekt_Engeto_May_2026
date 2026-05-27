# Projekt: Analýza dostupnosti potravin a vývoje mezd v ČR
Na analytickém oddělení nezávislé společnosti zabývající se životní úrovní občanů jsme zpracovali robustní datové podklady pro tiskové oddělení. Cílem projektu je zodpovědět definované výzkumné otázky týkající se dostupnosti základních potravin široké veřejnosti v závislosti na průměrných příjmech za určité časové období. Výsledky budou prezentovány na oborové konferenci.

Součástí analýzy je i srovnání makroekonomických ukazatelů (HDP, GINI koeficient, populace) s dalšími evropskými státy ve stejném období.

# 🗂 Datové podklady
Pro vypracování analýzy byly využity sady z Portálu otevřených dat ČR a další globální databáze.

## Primární tabulky

### czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.

### czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.

### czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.

### czechia_price – Informace o cenách vybraných potravin za několikaleté období.

### czechia_price_category – Číselník kategorií potravin, které se vyskytují v přehledu.  

## Číselníky sdílených informací o ČR
### czechia_region – Číselník krajů ČR dle normy CZ-NUTS 2.  

### czechia_district – Číselník okresů ČR dle normy LAU.  

## Dodatečné tabulky
### countries – Geografické a kulturní informace o zemích (hlavní město, měna, národní jídlo, průměrná výška populace).  

### economies – Makroekonomické ukazatele (HDP, GINI, daňová zátěž) pro daný stát a rok.  

## 🎯 Výstupy projektu
Výstupem analýzy je sada SQL skriptů a dvě finální databázové tabulky sloužící jako podklad pro zodpovězení výzkumných otázek:  

t_zuzana_klasova_project_SQL_primary_final – Sjednocená data mezd a cen potravin za ČR za totožné porovnatelné období (společné roky).

t_zuzana_klasova_project_SQL_secondary_final – Dodatečná makroekonomická data o dalších evropských státech.

## 📊 Výzkumné otázky a závěry analýzy


Závěr: Růst HDP zpravidla vytváří prostor pro růst mezd a cen, ale nemusí se to nutně a v plné síle projevit ve stejném nebo bezprostředně následujícím roce.
