*** Settings ***
Resource    ../resources/keywords/client_resource.robot
Resource    ../resources/pages/client_variaveis.robot
Resource    ../resources/pages/login_variaveis.robot
Resource    ../resources/keywords/navigation_resource.robot
Variables   ../fixtures/environments.yaml
Library    ../libs/get_fake_client.py

Suite Setup     Abrir o navegador e realizar login    user=${MAIL}    password=${PASSWORD}    url=${LOGIN.url}${LOGIN.endpoint}    browser=chrome
Suite Teardown    Fechar o navegador   

*** Test Cases ***
TC01 - Realizar cadastro de cliente com sucesso
    Navegar Para Página    url=${CLIENT.url}    url_complementar=${CLIENT.endpoint}
    Realizar cadastro de cliente    ${client}
    Wait Until Element Is Visible    class:css-laiely
    Capture Element Screenshot    class:css-laiely    cadastro_cliente.png

TC02 - Realizar cadastro de cliente sem e-mail
    Navegar Para Página    url=${CLIENT.url}    url_complementar=${CLIENT.endpoint}
    ${client}    Get Fake Client
    Realizar cadastro de cliente com falha   nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=   telefone=${client}[phone]    cargo=${client}[job]    rg=${client}[rg]  cpf=${client}[cpf]    cep=${client}[zipCode]    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    Wait Until Element Is Visible    class:css-bbipig
    Capture Element Screenshot    class:css-bbipig 
  

TC03 - Realizar cadastro de cliente sem rg
    Navegar Para Página    url=${CLIENT.url}    url_complementar=${CLIENT.endpoint}
    ${client}    Get Fake Client
    Realizar cadastro de cliente com falha    nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=${client}[email]    telefone=${client}[phone]   cargo=${client}[job]    rg=     cpf=${client}[cpf]    cep=${client}[zipCode]    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    Wait Until Element Contains    locator=class:css-1xsto0d   text=O campo RG é obrigatório.
    Capture Element Screenshot   class:css-laiely 
    
TC04 - Realizar cadastro de cliente sem cpf
    Navegar Para Página    url=${CLIENT.url}    url_complementar=${CLIENT.endpoint}
    ${client}    Get Fake Client
    Realizar cadastro de cliente com falha    nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=${client}[email]    telefone=${client}[phone]   cargo=${client}[job]    rg=${client}[rg]      cpf=  cep=${client}[zipCode]    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    Wait Until Element Contains    locator=class:css-1xsto0d   text=O campo CPF é obrigatório.
    Capture Element Screenshot   class:css-laiely 

  
TC05 - Consultar lista de clientes com sucesso
    Navegar Para Página    url=${CLIENT.url}    url_complementar=${CLIENT.endpoint}
    Wait Until Element Is Visible    class:css-dy4jwo
    Capture Element Screenshot    class:css-dy4jwo   lista_clientes.png



