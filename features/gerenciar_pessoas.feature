# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010
Funcionalidade: Gerenciar o cadastro de pessoas
  Cadastrar pessoas, editar pessoas e exculir pessoas.
  Também poder adicionar competências para a pessoa.
  A própria pessoa também pode cadastrar outras pessoas e editar ou excluir o próprio
  perfil.

  Contexto:
    Dado que eu esteja na página inicial
    Quando eu clico "Painel administrativo"
    Então eu devo estar na página de login do admin
    E eu preencho "email" com "nti.rhadmin@gmail.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário

  Cenário: Cadastrar pessoa como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de criação de pessoa
    Então eu devo ver "Nome"
    Quando eu preencho "Nome" com "Rodrigo"
    Quando eu preencho "Cpf" com "12345678901"
    Quando eu preencho "Endereco" com "Rodrigo"
    Quando eu preencho "Celular" com "Rodrigo"
    Quando eu preencho "Email" com "rodrigo@email.com"
    Quando eu preencho "Senha" com "123456"
    Quando eu aperto "Criar Pessoa"
    Então eu devo ver "Pessoa criada com sucesso"

  Cenário: Editar uma pessoa como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de pessoas
    Quando eu clico "José"
    Quando eu clico "Editar"
    Quando eu preencho "Nome" com "Pedro"
    Quando eu aperto "Atualizar Pessoa"
    Então eu devo ver "Pessoa atualizada com sucesso"

  Cenário: Mostrar os detalhes de uma pessoa como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de pessoas
    Quando eu clico "José"
    Então eu devo estar na página de visualização da pessoa "José"
    E eu devo ver "José"

  Cenário: Deletar uma pessoa como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de visualização da pessoa "Alejandro"
    Quando eu clico "Excluir cadastro"
    Então eu não devo ver "Alejandro"

  Cenário: Adicionar competência como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de visualização da pessoa "José"
    Quando eu clico "Clique aqui para adicionar uma nova competência"
    Então eu devo estar na página de criação de competencia
    Quando eu seleciono "Avançado" de "grau"
    E eu seleciono "Delphi" de "Conhecimento"
    Quando eu aperto "Adicionar"
    Então eu devo estar na página de visualização da pessoa "José"
    E eu devo ver "Competência adicionada com sucesso."

  Cenário: Remover uma competência como admin
    Dado que eu esteja logado como o administrador "nti.rh@gmail.com" com a senha "123456"
    Dado que eu esteja na página de visualização da pessoa "José"
    Então eu devo ver "Delphi"
    Quando eu clico "Remover"
    Então eu não devo ver "Delphi"