# language: pt
# Source: http://github.com/aslakhellesoy/cucumber/blob/master/examples/i18n/pt/features/adicao.feature
# Updated: Tue May 25 15:52:12 +0200 2010
Funcionalidade: Gerenciar o cadastro de pessoas
  Cadastrar pessoas, editar pessoas e exculir pessoas.
  Também poder adicionar competências para a pessoa.

  Contexto:
    Dado que eu esteja na página inicial
    Quando eu clico "Login"
    Então eu devo estar na página de login
    E eu preencho "email" com "nti.rhadmin@gmail.com"
    E eu preencho "senha" com "123456"
    Quando eu aperto "Login"
    Então eu devo estar na home do usuário

  Cenário: Cadastrar pessoa
    Dado que eu esteja na página de pessoas
    Quando eu clico "New Pessoa"
    Então eu devo ver "Nome"
    Quando eu preencho "Nome" com "Rodrigo"
    Quando eu preencho "Cpf" com "12345678901"
    Quando eu preencho "Endereco" com "Rodrigo"
    Quando eu preencho "Celular" com "Rodrigo"
    Quando eu aperto "Create Pessoa"
    Então eu devo ver "Pessoa criada com sucesso"

  Cenário: Editar uma pessoa
    Dado que eu esteja na página de pessoas
    Quando eu clico "José"
    Quando eu clico "Editar"
    Quando eu preencho "Nome" com "Pedro"
    Quando eu aperto "Update Pessoa"
    Então eu devo ver "Pessoa atualizada com sucesso"

  Cenário: Mostrar os detalhes de uma pessoa
    Dado que eu esteja na página de pessoas
    Quando eu clico "José"
    Então eu devo estar na página de visualização da pessoa "José"
    E eu devo ver "José"

  Cenário: Deletar uma pessoa
    Dado que eu esteja na página de pessoas
    Quando eu clico "destroy_pessoa_2"
    Então eu não devo ver "Alejandro"

  Cenário: Adicionar competência
    Dado que eu esteja na página de visualização da pessoa "José"
    Quando eu clico "Adicionar competência"
    Então eu devo estar na página de criação de competencia
    E eu preencho "Grau" com "3"
    E eu seleciono "Delphi" de "Conhecimento"
    Quando eu aperto "Create Competencia"
    Então eu devo estar na página de visualização da pessoa "José"
    E eu devo ver "Competência adicionada com sucesso."

  Cenário: Remover uma competência
    Dado que eu esteja na página de visualização da pessoa "José"
    Então eu devo ver "Delphi"
    Quando eu clico "Remover"
    Então eu não devo ver "Delphi"
