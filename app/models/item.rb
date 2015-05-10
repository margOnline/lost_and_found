class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :images

  validates :user, presence: true

  accepts_nested_attributes_for :images

  acts_as_taggable

  enum state: {
    initial: 0,
    lost: 1,
    found: 2,
    reunited: 3,
    archived: 4
  }

  def self.lost_items
    where(state: 1)
  end

  def self.found_items
    where(state: 2)
  end

  def self.recent
    Item.order(created_at: :desc).limit(5)
  end

  def profile
    images.first.thumbnail
  end

end
