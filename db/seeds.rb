require_dependency 'password'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

cargos = Cargo.create([{ :nome => "Programador Java", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"},
  { :nome => "Programador Delphi", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"},
  { :nome => "Programador C++", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"},
  { :nome => "Desenvolvedor Ruby on Rails", :salario_piso => 1500, :salario_teto => 7000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"},
  { :nome => "Webdesigner", :salario_piso => 800, :salario_teto => 4000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"}])

Conhecimento.create({ :nome => "Java", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "Ruby", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "C++", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "Delphi", :dominio => "Desenvolvimento" })

rodrigo = Pessoa.create({ :nome => "Rodrigo Castro", :cpf => "12345678901", :endereco => "Rua tal", :vinculado => true, :senha => "d5ba17d539ef6984b50d026cf83503f11dd75bb7a09c15cd36694de3786f932d137fa95ea7362cb0ce5f435482b61ffeb81879ee860f9d0130259d44a89c411392aekWM4NzjZUCulUeIDg6vgS156iI9FbQ1aH136lFtYjHBZTrxCoNDQYomW85vG", :email => "rodrigo@email.com" })
pedro = Pessoa.create({ :nome => "Pedro Antônio", :cpf => "12345678901", :endereco => "Rua tal", :vinculado => false, :senha => "d5ba17d539ef6984b50d026cf83503f11dd75bb7a09c15cd36694de3786f932d137fa95ea7362cb0ce5f435482b61ffeb81879ee860f9d0130259d44a89c411392aekWM4NzjZUCulUeIDg6vgS156iI9FbQ1aH136lFtYjHBZTrxCoNDQYomW85vG", :email => "pedro@email.com" })

projeto = Projeto.create({ :nome => "Projeto 1", :data_inicial => 2.days.ago })

User.create({ :nome => "Administrador", :email => "nti.rhadmin@gmail.com", :password => Password::update("123abc")})

v_rod = Vinculo.create({ :pessoa_id => rodrigo.id, :dataEntrada => 1.hour.ago, :salario => 1857.00 })
v_pedro = Vinculo.create({ :pessoa_id => pedro.id, :dataEntrada => 1.hour.ago, :salario => 1500.00 })

ParticipacaoProjeto.create({ :dataInicio => 2.days.ago, :vinculo_id => v_rod.id, :projeto_id => projeto.id, :cargo_id => cargos.first.id })