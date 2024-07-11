# problemaTecnicoZapImoveis

## Introdução

Este repositório contém a automação de testes para a funcionalidade de busca de imóveis no portal Zap Imóveis. A automação foi desenvolvida utilizando o Robot Framework e a biblioteca SeleniumLibrary para interagir com a interface do usuário.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:


### Descrição dos Arquivos

-   **buscarImoveis.robot**: Este arquivo contém os keywords específicos para a funcionalidade de busca de imóveis no site Zap Imóveis.
-   **setup.robot**: Este arquivo contém os keywords para a configuração inicial, como abrir o navegador e acessar a URL do site.
-   **teardown.robot**: Este arquivo contém os keywords para finalizar os testes, como fechar o navegador.
-   **buscaImoveis.robot**: Este arquivo contém os casos de teste que utilizam os keywords definidos nos arquivos mencionados acima.

## Casos de Teste

### CT01 - Buscar Imóveis - Cenário Positivo

Este caso de teste verifica se é possível buscar uma cobertura para alugar na cidade de São Paulo com campos preenchidos corretamente. O teste passa pelos seguintes passos:

1.  Acessa a página inicial do portal Zap Imóveis.
2.  Pesquisa uma cobertura para alugar na cidade de São Paulo.
3.  Verifica se a cobertura aceita pets.
4.  Valida que a lista de resultados é mostrada.

### CT02 - Buscar Imóveis - Cenário Negativo (Caracteres Especiais)

Este caso de teste verifica a funcionalidade de busca utilizando caracteres especiais nos campos de preço mínimo e máximo. Os passos incluem:

1.  Acessa a página inicial do portal Zap Imóveis.
2.  Pesquisa uma cobertura para alugar na cidade de São Paulo.
3.  Preenche os campos de preço mínimo e máximo utilizando caracteres especiais.
4.  Verifica que os campos não permitem a inserção de caracteres especiais.

### CT03 - Buscar Imóveis - Cenário Negativo (Dados Inválidos)

Este caso de teste verifica a funcionalidade de busca utilizando dados inválidos. Os passos incluem:

1.  Acessa a página inicial do portal Zap Imóveis.
2.  Pesquisa uma cobertura para alugar na cidade de São Paulo.
3.  Preenche o campo de busca com dados inválidos.
4.  Verifica que a busca não retorna resultados.

## Configuração e Execução

### Pré-requisitos

-   Python 3.x
-   Robot Framework
-   SeleniumLibrary
-   WebDriver para o navegador de sua escolha (por exemplo, ChromeDriver para Google Chrome)

### Instalação

1.  Clone o repositório:
    
    
    
    Copiar código
    
    `git clone https://github.com/seu-usuario/problemaTecnicoZapImoveis.git` 
    
2.  Navegue até o diretório do projeto:
    

    
    Copiar código
    
    `cd problemaTecnicoZapImoveis` 
    
3.  Instale as dependências:
    

    
    Copiar código
    
 `	python -m pip install --upgrade pip`

     `pip install robotframework`

    ` pip install robotframework-seleniumlibrary`

    ` pip install webdriver-manager`
    

### Executando os Testes

Para executar os testes, utilize o comando:



Copiar código

`robot tests/buscaImoveis.robot` 

Este comando executará todos os casos de teste definidos no arquivo `python -m robot -d ./problemaTecnicoZapImoveis/tests/result ./problemaTecnicoZapImoveis/tests/buscarImoveis.robot`.
