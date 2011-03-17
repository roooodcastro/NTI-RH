# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010
Funcionalidade: Gerenciar o login.
  Usuário cadastrado poderá entrar no sistema e ter acesso a suas diversas funções.
  Usuário que não for cadastrado deverá ter acesso restrito ao site, exceto em
  áreas específicas que possam talvez existir. Apenas o administrador poderá
  cadastrar outro usuário. Pessoas cadastradas no site também terão acesso a uma
  área específica delas, com diversas funções de visualização.

  Cenário: Fazer login como usuário
    Dado que eu esteja na página inicial
    Quando eu clico "Painel administrativo"
    Então eu devo estar na página de login do admin
    E eu preencho "email" com "usuario@rh.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário
    Dado que eu esteja na página de criação de user
    Então eu devo estar na home do usuário
    Então eu devo ver "Você não tem permissão para fazer isso"

  Cenário: Fazer login como administrador
    Dado que eu esteja na página inicial
    Quando eu clico "Painel administrativo"
    Então eu devo estar na página de login do admin
    E eu preencho "email" com "nti.rhadmin@gmail.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário
    Dado que eu esteja na página de criação de user
    Então eu devo ver "Novo usuário"

  Cenário: Fazer login como pessoa
    Dado que eu esteja na página inicial
    Quando eu clico "Login"
    Então eu devo estar na página de login da pessoa
    E eu preencho "email" com "jose@email.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home da pessoa

  Cenário: Fazer logout do sistema
    Dado que eu esteja na página inicial
    Quando eu clico "Painel administrativo"
    Então eu devo estar na página de login do admin
    E eu preencho "email" com "nti.rhadmin@gmail.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário
    Quando eu clico "Logout"
    Então eu devo estar na página inicial

  Cenário: Tentar acessar site sem estar logado
    Dado que eu esteja na página de pessoas
    Então eu devo estar na página inicial
    E eu devo ver "Acesso restrito. Você tem que estar logado para entrar nessa área"
