class Vinculo < ActiveRecord::Base
  belongs_to :pessoa
  has_many :comentarios, :foreign_key => "autor_id"
end
