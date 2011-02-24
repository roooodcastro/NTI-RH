class Competencia < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :conhecimento
end
