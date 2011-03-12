class Projeto < ActiveRecord::Base
  has_many :participacao_projetos

  validates :data_inicial, :presence => true
end
