class ParticipacaoProjeto < ActiveRecord::Base
  belongs_to :projeto
  belongs_to :cargo
  belongs_to :pessoa
  has_many :comentarios, :foreign_key => "destinatario_id"
end
