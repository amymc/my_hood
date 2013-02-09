class User < ActiveRecord::Base
	has_secure_password
  	validates :name, presence: true, uniqueness: true
  	validates :password, :password_confirmation, presence: true
  	attr_accessible :name, :password, :password_confirmation
end
