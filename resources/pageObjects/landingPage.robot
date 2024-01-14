*** Settings ***
Library                         SeleniumLibrary

*** Variables ***
${LANDING_PAGE_MAIN_TEXT} =     Ta pravá práce pro vás. Spolu ji najdeme.
${COOKIES_DENY_BUTTON} =        id=onetrust-reject-all-handler

*** Keywords ***
Načíst stránku
    Go To                        ${STARTINGPAGE}
    Maximize Browser Window

Zkontrolovat načtení stránky
    Wait Until Page Contains     ${LANDING_PAGE_MAIN_TEXT}

Nepovolit cookies
    Click Button                 ${COOKIES_DENY_BUTTON}