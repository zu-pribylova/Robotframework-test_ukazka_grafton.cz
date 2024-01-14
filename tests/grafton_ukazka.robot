*** Settings ***
Documentation                Informace o ukázkové test suite pro Grafton.cz
Resource                     ../resources/grafton_ukazkaApp.robot
Resource                     ../resources/common.robot
Test Setup                   Začít test webu
Test Teardown                Ukončit test webu

# text spouštěcího scriptu:
# robot -d results tests/grafton_ukazka.robot

*** Variables ***
${HLEDANA_POZICE} =          tester
${BROWSER} =                 chrome
${STARTINGPAGE} =            https://www.grafton.cz

*** Test Cases ***
Na webu (grafton.cz) lze vyfiltrovat a najít hledanou pozici na plný úvazek v oboru "IT - Vývoj softwaru"
    [Documentation]          Informace o ukázkovém testu č. 001 pro Grafton.cz
    [Tags]                   001
    common.Nastavit rychlost Selenium
    grafton_ukazkaApp.V prohlížeči přejít na adresu webu ("www.grafton.cz")
    grafton_ukazkaApp.V horním menu kliknutím vybrat "Nabídka práce"
    grafton_ukazkaApp.Na nově naběhlé stránce v levém rozbaleném menu "Dle úvazku" kliknutím vybrat "Plný úvazek"
    grafton_ukazkaApp.V rozbaleném "Dle oboru" kliknutím vybrat "IT - Vývoj softwaru"
    grafton_ukazkaApp.Ve vyhledávacím poli (s placeholderem "Název pracovní pozice") vyplnit hledanou pozici
    grafton_ukazkaApp.Stistknou klávesu "enter" na klávesnici
    grafton_ukazkaApp.Na stránce se ve vyfiltrovaných výsledcích nachází hledaná pozice