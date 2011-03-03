class Vinculo < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :cargo
  has_many :comentarios, :foreign_key => "autor_id"
  has_many :participacao_projetos
end
