class Item < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :user, presence: true
  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

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

  def self.found_times
    where(state: 2)
  end

end
