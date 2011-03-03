# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Cargo.create({ :nome => "Programador Java", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"})
Cargo.create({ :nome => "Programador Delphi", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"})
Cargo.create({ :nome => "Programador C++", :salario_piso => 1000, :salario_teto => 5000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"})
Cargo.create({ :nome => "Deesnvolvedor Ruby on Rails", :salario_piso => 1500, :salario_teto => 7000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"})
Cargo.create({ :nome => "Webdesigner", :salario_piso => 800, :salario_teto => 4000, :tempo_minimo => "1 ano", :tempo_maximo => "5 anos"})

Conhecimento.create({ :nome => "Java", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "Ruby", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "C++", :dominio => "Desenvolvimento" })
Conhecimento.create({ :nome => "Delphi", :dominio => "Desenvolvimento" })

User.create({ :nome => "Administrador", :email => "nti.rhadmin@gmail.com", :password => "123456"})