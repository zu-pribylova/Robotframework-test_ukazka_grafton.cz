*** Settings ***
Library                  SeleniumLibrary
Resource                 ../resources/pageObjects/landingPage.robot
Resource                 ../resources/pageObjects/searchPage.robot
Resource                 ../resources/pageObjects/topMenu.robot

*** Keywords ***
V prohlížeči přejít na adresu webu ("www.grafton.cz")
    landingPage.Načíst stránku
    landingPage.Zkontrolovat načtení stránky
    landingPage.Nepovolit cookies

V horním menu kliknutím vybrat "Nabídka práce"
    topMenu.Přejít na "Nabídka práce"
    searchPage.Zkontrolovat načtení stránky

Na nově naběhlé stránce v levém rozbaleném menu "Dle úvazku" kliknutím vybrat "Plný úvazek"
    searchPage.Vyfiltrovat nabídky na "Plný úvazek"
    searchPage.Zkontrolovat, že nabídky jsou vyfiltrované pouze na "plný úvazek"

V rozbaleném "Dle oboru" kliknutím vybrat "IT - Vývoj softwaru"
    searchPage.Vyfiltrovat Nabídky Pro "IT - Vývoj Softwaru"
    searchPage.Zkontrolovat, že Nabídky Jsou Vyfiltrované Pouze Pro "IT - Vývoj Softwaru"

Ve vyhledávacím poli (s placeholderem "Název pracovní pozice") vyplnit hledanou pozici
    searchPage.Vyplnit Zadanou Pozici

Stistknou klávesu "enter" na klávesnici
    searchPage.Potvrdit Zadání Názvu Vyhledávané Pozice

Na stránce se ve vyfiltrovaných výsledcích nachází hledaná pozice
    searchPage.Zkontrolovat Nalezení Vyhledávané Pozice Mezi Nalezenými Výsledky