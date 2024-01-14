*** Settings ***
Library                          SeleniumLibrary

*** Variables ***
${PLNY_UVAZEK} =                            link:Plný úvazek
${PLNY_UVAZEK_POCET_POZIC} =                xpath://*[@id="app"]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div/span
${OBOR_IT_VYVOJ_SOFTWARU} =                 link:IT - Vývoj softwaru
${OBOR_IT_VYVOJ_SOFTWARU_POCET_POZIC} =     xpath://*[@id="app"]/div[1]/div[1]/div[2]/div[4]/div[2]/div[1]/div/span
${POCET_POZIC_NALEZENO_CELKEM} =            xpath://*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/span
${POLE_HLEDANI_POZICE} =                    id:autosuggest__input
${VYSLEDKY_HLEDANI} =                       xpath://*[@id="app"]/div[1]/div[2]/div[2]/div

*** Keywords ***
Zkontrolovat načtení stránky
    Wait Until Page Contains     Nalezeno celkem
    
Vyfiltrovat nabídky na "Plný úvazek"
    Click Link                   ${PLNY_UVAZEK}
    
Zkontrolovat, že nabídky jsou vyfiltrované pouze na "plný úvazek"
    [Documentation]              Zkontroluje, že počet pozic vedle "Plný úvazek" odpovídá uvedenému nalezenému počtu pozic za "Nalezeno celkem"
    ${pocet_pozic_plny} =        Get Text    ${PLNY_UVAZEK_POCET_POZIC}
    Element Text Should Be       ${POCET_POZIC_NALEZENO_CELKEM}    ${pocet_pozic_plny}

Vyfiltrovat nabídky pro "IT - Vývoj softwaru"
    Click Link                   ${OBOR_IT_VYVOJ_SOFTWARU}

Zkontrolovat, že nabídky jsou vyfiltrované pouze pro "IT - Vývoj softwaru"
    [Documentation]              Zkontroluje, že počet pozic vedle "IT - Vývoj softwaru" odpovídá uvedenému nalezenému počtu pozic za "Nalezeno celkem"
    ${pocet_pozic_IT} =          Get Text    ${OBOR_IT_VYVOJ_SOFTWARU_POCET_POZIC}
    Element Text Should Be       ${POCET_POZIC_NALEZENO_CELKEM}    ${pocet_pozic_IT}

Vyplnit zadanou pozici
    Input Text                   ${POLE_HLEDANI_POZICE}    ${HLEDANA_POZICE}

Potvrdit zadání názvu vyhledávané pozice
    [Documentation]              Stisknutí klávesy "enter"
    Press Keys                   ${POLE_HLEDANI_POZICE}   \ue007

Zkontrolovat nalezení vyhledávané pozice mezi nalezenými výsledky
    Element Should Contain       ${VYSLEDKY_HLEDANI}    ${HLEDANA_POZICE}    ignore_case=True