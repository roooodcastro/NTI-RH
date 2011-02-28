class Pessoa < ActiveRecord::Base

  validates :nome, :presence => true
  validates :cpf, :presence => true, :length => { :within => 11..11 }
  validates :endereco, :presence => true
  


  def self.outra
    self.nome == "joão"
  end

  has_many :competencias

end