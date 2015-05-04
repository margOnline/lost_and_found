require 'rails_helper'

describe Item do
  it { should belong_to :user }
  it { should validate_presence_of :user }
  it { should validate_attachment_content_type(:image).
    allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }

  describe ".lost_items" do
    it "returns items that are 'lost'" do
      user = FactoryGirl.create(:user)
      lost_item = FactoryGirl.create(:item, user_id: user.id)
      found_item = FactoryGirl.create(:item, user_id: user.id, state: 2)
      expect(Item.lost_items).to eq [lost_item]
      expect(Item.lost_items).not_to include [found_item]
    end
  end
end
