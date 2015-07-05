require 'rails_helper'

describe Item do
  it { should belong_to :user }
  it { should belong_to :category }
  it { should have_many :images}

  it { should validate_presence_of :user }

  describe "class methods" do
    let(:user) { FactoryGirl.create(:user) }
    let(:lost_item) { FactoryGirl.create(:item, user_id: user.id) }
    let(:found_item) { FactoryGirl.create(:item, user_id: user.id, state: 2) }
    
    describe ".lost_items" do
      it "returns items that are 'lost'" do      
        expect(Item.lost_items).to eq [lost_item]
        expect(Item.lost_items).not_to include [found_item]
      end
    end

    describe ".found_items" do
      it "returns items that are 'lost'" do
        expect(Item.found_items).to eq [found_item]
        expect(Item.found_items).not_to include [lost_item]
      end
    end

    describe ".recent" do
      it "returns 5 most recently added items ordered by date added" do
        old_item = FactoryGirl.create(:item, user_id: user.id)
        new_item = FactoryGirl.create(:item, user_id: user.id, state: 2)
        expect(Item.recent).to eq [new_item, old_item]
      end
    end

    describe ".united" do
      it "returns items that have been matched" do
        non_united_item = FactoryGirl.create(:item, user_id: user.id)
        united_item = FactoryGirl.create(:item, user_id: user.id, state: 3)
        expect(Item.united).to eq [united_item]
      end
    end
  end

  describe "#matches" do
    let(:user) { FactoryGirl.create(:user) }
    let(:lost_item) { FactoryGirl.create(:item, user_id: user.id).tag_list.add('bag') }
    let(:found_item) { FactoryGirl.create(:item, user_id: user.id, state: 2).tag_list.add('bag') }

    def method_name
      get :matching, id: lost_item.id
      expect(response).to eq [found_item]
    end
  end
end
