class User < ActiveRecord::Base
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
