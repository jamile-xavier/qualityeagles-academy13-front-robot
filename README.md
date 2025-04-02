<h1 align="center">Teste de Automação Front com Robot - ERP Quality Eagles Academy T13 Qa Coders </h1>

## Descrição do Projeto

<h2 align="center">
Teste de Automação Front de ERP
</h2>
<p align="center"> Realização de testes automação de front do ERP disponibilizado pela Qa Coders para a equipe Quality Eagles T13. </p>
<p align="center">Testes de endpoints: Login, Users, Client e Company</p>
<p align="center"> Realização de testes de sucesso e alguns de exceção dos endpoints mencionados.</p>
<p align="center">Para realização dos testes foi utilizado os casos de testes e critérios de aceites disponibilizados pela Qa Coders através do Azure e também os endpoints disponibilizados através do Swagger.</p>
<p align="center"> O Azure também foi utilizado para abertura das PBI´s, Test Plan Suite e Test Pan.</p>

### Sumário

- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Pre requisitos](#Pré-requisitos)
- [Executando o projeto](#Executando-o-projeto)
- [Autora](#autora)
- [Licença](#licença)

### Funcionalidades

- [x] Fazer login;
- [ ] Cadastrar usuário;
- [x] Listar usuário;
- [ ] Atualizar cadastro de usuário;
- [ ] Excluir usuário;
- [x] Cadastrar cliente;
- [x] Listar cliente;
- [ ] Atualizar cadastro de cliente;
- [ ] Excluir cliente;
- [ ] Cadastro de empresa;
- [x] Listar Empresas;
- [ ] Atualizar cadastro da empresa;
- [ ] Excluir empresa;

### Tecnologias

- [Robot](https://robotframework.org/)
- [Swagger](https://swagger.io/)
- [Azure](https://azure.microsoft.com/pt-br/)

### Pré-requisitos

Para utilizar o projeto em sua máquina será necessário possuir as seguintes ferramentas:
[VsCode](https://code.visualstudio.com/) - Ou outra IDE de sua preferência. O passo a passo refere-se a utilização do VsCode.

#### Dependências

[Robot](https://robotframework.org/)
[RequestsLibrary](https://docs.robotframework.org/docs/different_libraries/requests)

As dependências poderão ser instaladas manualmente ou utilizando o comando disponível em executando o projeto para que todas as dependências listadas no arquivo requeriments.txt sejam instaladas na raiz do projeto.

### Executando-o-projeto

- Realizar o dowload do projeto;
- Abrir o VsCode;
- Clicar em File;
- Open Folder;
- Selecionar pasta;
- Abrir o terminal e digitar o comando para instalar as dependências:

```bash
pip install -r requeriments.txt
```

- Digitar no terminal o comando para executar todos os testes

```bash
robot -d log .\tests\
```

Para executar os testes por arquivo:

Teste de clientes:

```bash
 robot -d log .\tests\client.robot
```

Teste de empresas:

```bash
 robot -d log .\tests\company.robot
```

Teste de login:

```bash
 robot -d log .\tests\login.robot
```

Teste de usuários:

```bash
 robot -d log .\tests\user.robot
```

### Autora

<p> Jamile Xavier Mendonça </p>

[Github](https://github.com/jamile-xavier)

[Linkedin](https://www.linkedin.com/in/jamile-xavier/)

### Licença

MIT
