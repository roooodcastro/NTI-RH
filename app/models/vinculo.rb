class Vinculo < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :cargo
  has_many :comentarios, :foreign_key => "autor_id"
  has_many :participacao_projetos

  def self.has_active_vinculo?
    self.all.each do |vinculo|
      return true if not vinculo.dataSaida
    end
    false
  end
end