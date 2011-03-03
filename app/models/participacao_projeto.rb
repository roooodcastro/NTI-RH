class ParticipacaoProjeto < ActiveRecord::Base
  belongs_to :projeto
  belongs_to :cargo
  belongs_to :vinculo
  has_many :comentarios, :foreign_key => "destinatario_id"

  validates :projeto_id, :presence => true
  validates :cargo_id, :presence => true
  validates :vinculo_id, :presence => true
end
