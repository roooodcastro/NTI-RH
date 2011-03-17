class Comentario < ActiveRecord::Base
  belongs_to :participacao_projeto, :foreign_key => "destinatario_id"
  belongs_to :vinculo, :foreign_key => "autor_id"
end