class Item < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :user, presence: true
  validates_attachment_content_type :image, :content_type => /image/

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

end
