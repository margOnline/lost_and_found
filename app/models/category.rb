class Category < ActiveRecord::Base
  has_many :items

  validates :name, presence: true

  def number_of_items
    
  end
end
