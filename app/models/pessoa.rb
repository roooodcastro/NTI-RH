class Pessoa < ActiveRecord::Base

  validates :nome, :presence => true
  validates :cpf, :presence => true, :length => { :within => 11..11 }
  validates :endereco, :presence => true

  has_many :competencias
  has_many :vinculos

end