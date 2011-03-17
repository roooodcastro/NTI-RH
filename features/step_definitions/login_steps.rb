# encoding:utf-8

Dado /^que eu esteja logado como o administrador "(.+)" com a senha "(.+)"$/ do |email, password|
  Dado %{que eu esteja na página de login do admin}
  E %{eu preencho "email" com "#{email}"}
  E %{eu preencho "senha" com "#{password}"}
  E %{eu aperto "Login"}
end

Dado /^que eu esteja logado como a pessoa "(.+)" com a senha "(.+)"$/ do |email, password|
  Dado %{que eu esteja na página de login da pessoa}
  E %{eu preencho "email" com "#{email}"}
  E %{eu preencho "senha" com "#{password}"}
  E %{eu aperto "Login"}
end