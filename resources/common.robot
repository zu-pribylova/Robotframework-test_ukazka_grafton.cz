*** Settings ***
Library                     SeleniumLibrary

*** Keywords ***
Začít test webu
    Open Browser            about:blank    ${BROWSER}

Ukončit test webu
    Sleep                   3s
    Close All Browsers

Nastavit rychlost Selenium
    Set Selenium Speed      .2s
    Set Selenium Timeout    10s