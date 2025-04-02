*** Settings ***
Resource    ../resources/keywords/user_resource.robot
Resource    ../resources/pages/user_variaveis.robot
Resource    ../resources/pages/login_variaveis.robot
Resource    ../resources/keywords/navigation_resource.robot
Variables   ../fixtures/environments.yaml

Suite Setup     Abrir o navegador e realizar login    user=${MAIL}    password=${PASSWORD}    url=${LOGIN.url}${LOGIN.endpoint}    browser=chrome
Suite Teardown    Fechar o navegador   

*** Test Cases ***
#TC01 - Realizar cadastro de usuário com sucesso
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
#    Realizar cadastro de usuario    ${user}
   
#TC02 - Realizar cadastro de usuário sem nome completo
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint} 
#    ${user}    Get Fake Person
#    Realizar cadastro de usuario    nomeCompleto=    email=${user}[email]  perfilAcesso=Administrador    cpf=${user}[cpf]    senha=${user}[password]   confirmarSenha=${user}[password] 
#    Capture Page Screenshot   
#    Fechar o navegador
#
#TC03 - Realizar cadastro de usuário sem cpf
#    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
#    ${user}    Get Fake Person
#    Realizar cadastro de usuario com falha    nomeCompleto=${user}[name]     email=${user}[email]  perfilAcesso=Administrador    cpf=   senha=${user}[password]   confirmarSenha=${user}[password] 
#    Capture Page Screenshot   
#    Fechar o navegador   


TC04 - Consultar lista de usuário com sucesso
    Navegar Para Página    url=${USER.url}    url_complementar=${USER.endpoint}
    Wait Until Element Is Visible    class:css-nhyiur
    Capture Element Screenshot    class:css-nhyiur    lista_usuarios.png

