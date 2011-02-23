class Competencia < ActiveRecord::Base

  has_one :conhecimento
  belongs_to :pessoa
end
