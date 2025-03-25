*** Settings ***
Library    SeleniumLibrary
Library    libs/get_fake_person.py
Library    libs/get_fake_client.py
Library    libs/get_fake_company.py


*** Variables ***
# URL
#${BASE_URL}    https://quality-eagles-front.qacoders.dev.br
${BASE_URL}    https://automacao.qacoders-academy.com.br
${LOGIN}    ${BASE_URL}/login
${EMPRESA}    ${BASE_URL}/company
${CLIENTE}    ${BASE_URL}/client
${USUARIO}    ${BASE_URL}/user



${BROWSER}    Chrome

#Botões
${btn_entrar}    button[id=login]
${btn_salvarNovo}    button[id=save]
${btn_novoCadastro}    button[id="Novo Cadastro"]
${btn_logout}    button[class*=css-1nvbq2d]
${btn_editar}    button[id=edit]

#Input
${input_email}    input[id=email]
${input_mail}    input[id=mail]
${input_senha}    input[id=password]
${input_confirmarSenha}    input[id=confirmPassword]
${input_razaoSocial}    input[id=companyName]
${input_nomeFantasia}    input[id=fantasyName]
${input_emailCompany}     input[id=companyMail]
${input_cnpj}     input[id=matriz]
${input_telefoneEmpresa}     input[id=telephone]
${input_telefone}     input[id=phone]
${input_descricaoServico}     input[id=serviceDescription]
${input_nomeResponsavel}     input[name=fullName]
${input_cep}     input[id=zipCode]
${input_pais}     input[id=country]
${input_cidade}     input[id=city]
${input_estado}     input[id=state]
${input_bairro}     input[id=district]
${input_rua}     input[id=street]
${input_numeroImovel}     input[id=number]
${input_complemento}     input[id=complement]
${input_nomeCompleto}    input[id=fullName]
${input_dataNascimento}     input[id=birthDate]
${input_cargo}    input[id=currentRole]
${input_rg}    input[name=rg]
${input_cargo}    [id=currentRole]
${input_cargo}    [id=currentRole]
${input_cargo}    [id=currentRole]
${input_cargo}    [id=currentRole]
${input_cpf}    input[name=cpf]
${input_perfilAcesso}    input[id=accessProfile]

# Div
${div_cadastros}    div[id=Cadastros]

#Msg
${msg_error}    div[class*=MuiAlert-standardError] 
${msg_sucesso}    div=[MuiAlert-message]
${msg_alert}    div[class*=MuiAlert-message]

#Lista
${lista_empresas}    css=div[class*="css-nhyiur"] 
${lista_usuarios}    css=ul[class*=css-18psgb0]
${lista_clientes}    css=div[class*=css-dy4jwo]

#Form
${form_cadastroEmpresa}     css=form[class*="css-ffwpz9"]
${form_cadastroCliente}    form=[class*=css-ffwpz9]

*** Test Cases ***
TC01 - Realizar login com sucesso Admin
   Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
   Fechar o navegador
    
TC02 - Realizar login com senha inválida
    Realizar login    email=sysadmin@qacoders.com    senha=1234@Tests
    Fechar o navegador

TC03 - Realizar login com email inválido
    Realizar login    email=sysadmin@qacoders.com.br   senha=1234@Test
    Fechar o navegador

#TC04 - Realizar cadastro de empresa com sucesso
#    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
#    ${company}    Get Fake Company
#    Realizar cadastro de empresa    razaoSocial=${company}[corporateName]   nomeFantasia=${company}[fantasyName]    emailCompany=${company}[corporateEmail]  cnpj=${company}[cnpj]  telefone=55119874512478    descricaoServico=${company}[serviceDescription]   nomeResponsavel=${company}[responsibleName]   cep=04777001    pais=Brasil    cidade=São Paulo    estado=SP    bairro=Bom Jardim    rua=Avenida Interlagos    numeroImovel=50    complemento=Loja 05    
#    Capture Page Screenshot   
#    Fechar o navegador

TC05 - Consultar Lista de Empresas com sucesso
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    Navegar Para Página    ${EMPRESA}
    Wait Until Element Is Visible    ${lista_empresas}   
    Capture Element Screenshot    ${lista_empresas}    lista_empresas.png
    Fechar o navegador

#TC06 - Editar empresa com sucesso


TC07 - Realizar cadastro de cliente com sucesso
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test  
    ${client}    Get Fake Client
    Realizar cadastro de cliente    nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=${client}[email]    telefone=${client}[phone]   cargo=${client}[job]    rg=${client}[rg]  cpf=${client}[cpf]    cep=${client}[zipCode]    pais=Brasil    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    #Wait Until Element Is Visible    ${msg_sucesso}
    #Capture Page Screenshot
    Fechar o navegador

TC08 - Realizar cadastro de cliente sem e-mail
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test  
    ${client}    Get Fake Client
    Realizar cadastro de cliente    nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=   telefone=${client}[phone]    cargo=${client}[job]    rg=${client}[rg]  cpf=${client}[cpf]    cep=${client}[zipCode]    pais=Brasil    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    #Wait Until Element Is Visible    ${msg_error}
    Capture Page Screenshot
    Fechar o navegador

TC09 - Realizar cadastro de cliente sem rg
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test  
    ${client}    Get Fake Client
    Realizar cadastro de cliente    nomeCompleto=${client}[name]    dataNascimento=${client}[birthday]   email=${client}[email]    telefone=${client}[phone]   cargo=${client}[job]    rg=     cpf=${client}[cpf]    cep=${client}[zipCode]    pais=Brasil    cidade=${client}[city]   estado=${client}[state]    bairro=${client}[neighborhood]    rua=${client}[street]    numeroImovel=${client}[number]    complemento=Apto 531
    #Wait Until Element Is Visible    ${msg_alert}
    Capture Page Screenshot
    Fechar o navegador

TC10 - Realizar consulta de clientes com sucesso
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    Navegar Para Página    ${CLIENTE}
    Wait Until Element Is Visible    ${lista_clientes} 
    Capture Element Screenshot    ${lista_clientes}    lista_clientes.png
    Fechar o navegador

#TC11 - Editar cadastro de cliente com sucesso
#    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test  
 #   ${client}    Get Fake Client
#    Editar cadastro de cliente    telefone=${client}[phone]
 #   #Wait Until Element Is Visible    ${msg_sucesso}
  #  Capture Page Screenshot
   # Fechar o navegador

TC11 - Realizar cadastro de usuário com sucesso
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    ${user}    Get Fake Person
    Realizar cadastro de usuario    nomeCompleto=${user}[name]    email=${user}[email]  perfilAcesso=ADMIN    cpf=${user}[cpf]    senha=${user}[password]   confirmarSenha=${user}[password] 
    Capture Page Screenshot   
    Fechar o navegador

TC12 - Realizar cadastro de usuário sem nome completo
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    ${user}    Get Fake Person
    Realizar cadastro de usuario    nomeCompleto=    email=${user}[email]  perfilAcesso=ADMIN    cpf=${user}[cpf]    senha=${user}[password]   confirmarSenha=${user}[password] 
    Capture Page Screenshot   
    Fechar o navegador

T13 - Realizar cadastro de usuário sem cpf
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    ${user}    Get Fake Person
    Realizar cadastro de usuario    nomeCompleto=${user}[name]     email=${user}[email]  perfilAcesso=ADMIN    cpf=   senha=${user}[password]   confirmarSenha=${user}[password] 
    Capture Page Screenshot   
    Fechar o navegador

TC14 - Realizar consulta de usuário com sucesso
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    Navegar Para Página    ${USUARIO}
    Wait Until Element Is Visible    ${lista_usuarios} 
    Capture Element Screenshot    ${lista_usuarios}    lista_usuarios.png
    Fechar o navegador



*** Keywords ***
Realizar Login
    [Documentation]    Keyword usada para realizar login, é obrigatório 2 argumentos: [senha] e [email]
    [Arguments]    ${email}    ${senha}
    Abrir Navegador
    Input Text    css=${input_email}    ${email}    
    Input Text    css=${input_senha}    ${senha}
    Click Button    css=${btn_entrar}
    Wait Until Element Is Visible    css=${msg_error}
    Capture Element Screenshot    css=${msg_error} 
    

Realizar Login com sucesso
    [Documentation]    Keyword usada para realizar login com sucesso
    [Arguments]    ${email}    ${senha}
    Abrir Navegador
    Input Text    css=${input_email}    ${email}    
    Input Text    css=${input_senha}    ${senha}
    Click Button    css=${btn_entrar}
    Wait Until Element Is Visible    css=${btn_logout}
    #Element Should Be Visible    css=${div_cadastros}
    #Capture Element Screenshot    css=${div_cadastros} 
    Capture Page Screenshot   

Realizar cadastro de empresa
    [Documentation]       Keyword usada para realizar cadastro de uma empresa
    [Arguments]    ${razaoSocial}    ${nomeFantasia}    ${emailCompany}    ${cnpj}    ${telefone}    ${descricaoServico}    ${nomeResponsavel}    ${cep}    ${pais}    ${cidade}    ${estado}    ${bairro}    ${rua}    ${numeroImovel}    ${complemento}    
    Navegar Para Página    ${EMPRESA}
    Wait Until Element Is Visible    ${lista_empresas}    timeout=30s 
    Click Button    css=${btn_novoCadastro}
    Wait Until Element Is Visible    ${form_cadastroEmpresa}
    Input Text    css=${input_razaoSocial}    ${razaoSocial}
    Input Text    css=${input_nomeFantasia}    ${nomeFantasia}
    Input Text    css=${input_emailCompany}     ${emailCompany} 
    Input Text    css=${input_cnpj}      ${cnpj}
    Input Text    css=${input_telefoneEmpresa}     ${telefone}  
    Input Text    css=${input_descricaoServico}      ${descricaoServico}
    Input Text    css=${input_nomeResponsavel}     ${nomeResponsavel} 
    Input Text    css=${input_cep}     ${cep}
    Input Text    css=${input_pais}     ${pais}
    Input Text    css=${input_cidade}     ${cidade}
    Input Text    css=${input_estado}     ${estado}
    Input Text    css=${input_bairro}     ${bairro}
    Input Text    css=${input_rua}     ${rua} 
    Input Text    css=${input_numeroImovel}     ${numeroImovel}
    Input Text    css=${input_complemento}     ${complemento} 
    Click Button    css=${btn_salvarNovo}

Realizar consulta de empresas 
    [Documentation]    Keyword usada para consultar empresas cadastradas
    [Arguments]    ${quantidade_esperada}=30
    Realizar Login com sucesso   email=sysadmin@qacoders.com    senha=1234@Test 
    Navegar Para Página    ${EMPRESA} 
    Wait Until Element Is Visible    ${lista_empresas}    timeout=30s
    Capture Element Screenshot    ${lista_empresas}    lista_empresas.png
Realizar cadastro de cliente
    [Documentation]    Keyword utilizada para cadastro de cliente
    [Arguments]      ${nomeCompleto}    ${dataNascimento}    ${email}    ${telefone}    ${cargo}    ${rg}    ${cpf}    ${cep}    ${pais}    ${cidade}    ${estado}    ${bairro}    ${rua}    ${numeroImovel}    ${complemento}
    Navegar Para Página    ${CLIENTE}
    Wait Until Element Is Visible    ${lista_clientes}    timeout=30s 
    Click Button    css=${btn_novoCadastro}
    #Wait Until Element Is Visible    ${form_cadastroCliente}
    Input Text    css=${input_nomeCompleto}    ${nomeCompleto}
    Input Text    css=${input_dataNascimento}    ${dataNascimento}
    Input Text    css=${input_mail}    ${email}
    Input Text    css=${input_telefone}    ${telefone}
    Input Text    css=${input_cargo}    ${cargo}
    Input Text    css=${input_rg}    ${rg}
    Input Text    css=${input_cpf}    ${cpf}
    Input Text    css=${input_cep}     ${cep}
    Input Text    css=${input_pais}     ${pais}
    Input Text    css=${input_cidade}     ${cidade}
    Input Text    css=${input_estado}     ${estado}
    Input Text    css=${input_bairro}     ${bairro}
    Input Text    css=${input_rua}     ${rua} 
    Input Text    css=${input_numeroImovel}     ${numeroImovel}
    Input Text    css=${input_complemento}     ${complemento}
    Click Button    css=${btn_salvarNovo}
    Capture Page Screenshot

Editar cadastro de cliente
    [Documentation]    Keyword utilizada para realizar alteração do telefone de cliente
    [Arguments]      ${telefone}   
    Navegar Para Página    ${CLIENTE}
    Wait Until Element Is Visible    ${btn_editar}    timeout=30s 
    Click Button    css=${btn_editar}
    #Wait Until Element Is Visible    ${form_cadastroCliente}
    Input Text    css=${input_telefone}    ${telefone}
    Capture Page Screenshot
Realizar cadastro de usuario
    [Documentation]    Keyword usada para realizar cadastro de usuário, é obrigatório 6 argumentos: [nomeCompleto], [email], [perfilAcesso], [cpf], [senha] e [confirmarSenha]
    [Arguments]    ${nomeCompleto}    ${email}    ${perfilAcesso}    ${cpf}    ${senha}    ${confirmarSenha}
    Navegar Para Página    ${USUARIO}
    Wait Until Element Is Visible    ${lista_usuarios}    timeout=30s 
    Click Button    css=${btn_novoCadastro}
    Input Text    css=${input_nomeCompleto}    ${nomeCompleto}    
    Input Text    css=${input_mail}    ${email}
    Input Text    css=${input_perfilAcesso}    ${perfilAcesso}
    Input Text    css=${input_cpf}    ${cpf}
    Input Text    css=${input_senha}    ${senha}
    Input Text    css=${input_confirmarSenha}    ${confirmarSenha}
    Click Button    css=${btn_salvarNovo}


Abrir Navegador
    [Documentation]    Abre o navegador na página especificada
    [Arguments]    ${pagina}=${LOGIN}    ${browser}=${BROWSER}
    Open Browser    ${pagina}    ${browser}    options=add_argument("--headless")
    #Open Browser    ${pagina}    ${browser}    
    Maximize Browser Window

Fechar o navegador
    Close Browser

Navegar Para Página
    [Documentation]    Navega para a página especificada
    [Arguments]    ${pagina}=${LOGIN}
    Go To    ${pagina}
    #Wait Until Element Is Visible    ${div_cadastros}    timeout=30s