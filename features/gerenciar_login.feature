# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010
Funcionalidade: Gerenciar o login.
  Usuário cadastrado poderá entrar no sistema e ter acesso a suas diversas funções.
  Usuário que não for cadastrado deverá ter acesso restrito ao site, exceto em
  áreas específicas que possam talvez existir. Apenas usuários cadastrados e logados
  podem poder cadastrar outro usuário.

  Cenário: Fazer login como administrador
    Dado que eu esteja na página inicial
    Quando eu clico "Login"
    Então eu devo estar na página de login
    E eu preencho "email" com "nti.rhadmin@gmail.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário

  Cenário: Fazer logout do sistema
    Dado que eu esteja na página inicial
    Quando eu clico "Login"
    Então eu devo estar na página de login
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
