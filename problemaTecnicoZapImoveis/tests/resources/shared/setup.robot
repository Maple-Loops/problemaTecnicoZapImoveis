*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://www.zapimoveis.com.br/

*** Keywords ***
Acesso a home page do site www.zapimoveis.com.br
    Open Browser    ${URL}    browser=${BROWSER}     
    Maximize Browser Window