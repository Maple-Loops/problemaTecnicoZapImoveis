*** Settings ***
Library           SeleniumLibrary
Resource    resources/pages/buscarImoveis.robot
Resource    resources/shared/setup.robot
Resource    resources/shared/teardown.robot
Test Setup         Acesso a home page do site www.zapimoveis.com.br
Test Teardown      Fechar o navegador

*** Test Cases ***

CT01 - Buscar Imóveis - Cenário Positivo
    [Documentation]    Cenário de teste positivo: Busca por cobertura para alugar na cidade de São Paulo com campos preenchidos corretamente.
    [Tags]    CT01
    Dado que estou na página inicial do portal ZAP imóveis
    Quando pesquiso uma cobertura para alugar na cidade de São Paulo
    E a cobertura deve aceitar Pets
    #E deve estar pronta para morar | Na aba Alugar, não existe a opção "Pronta para Morar". Essa opção só existe na aba de Comprar.
    Então a lista de resultados é mostrada

CT02 - Buscar Imóveis - Cenário Negativo
    [Documentation]    Cenário de teste negativo: Busca por cobertura para alugar na cidade de São Paulo utilizando caracteres especiais no campo price range.
    [Tags]    CT02
    Dado que estou na página inicial do portal ZAP imóveis
    Quando pesquiso uma cobertura para alugar na cidade de São Paulo
    E preencho os campos referente ao Preço Mínimo e Máximo utilizando caracteres especiais
    Então os campos não devem permitir a inserção de caracteres especiais

CT03 - Buscar Imóveis - Cenário Negativo
    [Documentation]    Cenário de teste negativo: Busca por cobertura para alugar na cidade de São Paulo utilizando dados inválidos.
    [Tags]    CT03

    Dado que estou na página inicial do portal ZAP imóveis
    Quando pesquiso uma cobertura para alugar na cidade de São Paulo
    E preencho os campos referente a busca com dados inválidos
    Então a busca não deverá retornar resultados
