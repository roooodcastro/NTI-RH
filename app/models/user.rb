class User < ActiveRecord::Base
  
  validates :nome, :presence => true
  validates :email, :presence => true, :valid_email => true, :uniqueness => true
  validates :password, :presence => true, :length => { :minimum => 6 }
end