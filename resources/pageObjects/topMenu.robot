*** Settings ***
Library                          SeleniumLibrary

*** Variables ***
${MENU_NABIDKA_PRACE} =          link:Nabídka práce

*** Keywords ***
Přejít na "Nabídka práce"
    Click Link                   ${MENU_NABIDKA_PRACE}