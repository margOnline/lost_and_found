class User < ActiveRecord::Base
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :items
end
