class Cargo < ActiveRecord::Base
  has_many :participacao_projeto
  has_many :vinculos
end
