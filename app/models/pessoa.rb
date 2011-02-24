class Pessoa < ActiveRecord::Base

  validate :nome, presence => true
  validate :cpf, presence => true
  validate :endereco, presence => true

  has_many :competencias
end