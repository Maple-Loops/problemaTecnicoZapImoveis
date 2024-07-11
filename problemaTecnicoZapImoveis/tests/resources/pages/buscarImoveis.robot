*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME}      //*[@id="__next"]/main/section[1]/section/div/main/div/div[1]/h1
${ALUGAR}    //button[@type='button'][contains(.,'Alugar')]
${LOCAL}     //input[@placeholder='Digite o nome da rua, bairro ou cidade']
${SP}        //input[@value='BR-Sao_Paulo-NULL-Sao_Paulo']
${IMOVEL}    //div[@class='l-multiselect__input-label'][contains(.,'Todos os imóveis')]
${COBERTURA}    //label[@data-testid='undefined-item-0-7'][contains(.,'Cobertura')]
${BUSCAR}    //button[@data-testid='l-button'][contains(.,'Buscar')]
${BTNENTENDI}    //button[@class='cookie-notifier__cta'][contains(.,'Entendi')]
${ACCPETS}    //input[contains(@value,'PETS_ALLOWED')]
${BUSCIMOV}    //button[@data-testid='l-button'][contains(.,'Buscar Imóveis')]
${VALORMIN}    //input[contains(@id,'l-input-1249963')]
${VALORMAX}    //input[contains(@id,'l-input-1249964')]
${PESQUISAR}    //input[contains(@id,'l-input-1250032')]
${SEMRESULTADOS}    //*[@id="__next"]/main/section/div/form/div[2]/div[1]/div/div[1]/div[1]/section/div[1]/div/div[2]/div/section/text()

*** Keywords ***
Dado que estou na página inicial do portal ZAP imóveis
    Element Should Contain  ${HOME}     A casa que você quer está aqui.
    Click Element    ${BTNENTENDI} 

Quando pesquiso uma cobertura para alugar na cidade de São Paulo
    Click Element    ${ALUGAR}
    Element Should Contain    ${ALUGAR}    Alugar
    Wait Until Element Is Visible    ${LOCAL}    timeout=10s
    Input Text    ${LOCAL}    São Paulo
    Wait Until Element Is Visible    ${SP}
    Click Element    ${SP}
    Click Element    ${IMOVEL}
    Click Element    ${BUSCAR}       
    Scroll Element Into View    ${ACCPETS}
    Click Element    ${ACCPETS}
 

E a cobertura deve aceitar Pets
    Scroll Element Into View   ${COBERTURA}    
    Click Element    ${COBERTURA}
#E deve estar pronta para morar

Então a lista de resultados é mostrada
   Click Element    ${BUSCIMOV}

E preencho os campos referente ao Preço Mínimo e Máximo utilizando caracteres especiais
    Input Text    ${VALORMIN}    2@#3!$%5
    Input Text    ${VALORMAX}    4%$#3@!3


Então os campos não devem permitir a inserção de caracteres especiais
    ${valormin_text}=    Get Element Attribute    ${VALORMIN}    value
    ${valormax_text}=    Get Element Attribute    ${VALORMAX}    value
    Should Not Match Regexp    ${valormin_text}    [^0-9]
    Should Not Match Regexp    ${valormax_text}    [^0-9]
  
E preencho os campos referente a busca com dados inválidos
    Input text      ${PESQUISAR}    teste_inválido_123

Então a busca não deverá retornar resultados
    Wait Until Element Is Visible    ${SEMRESULTADOS}