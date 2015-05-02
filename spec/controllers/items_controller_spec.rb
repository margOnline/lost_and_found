require 'rails_helper'

describe ItemsController do
  describe "#new" do
    it "should display the new form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'create' do
    it 'displays successfully' do
      expect{ post :create, item: {
        description: 'whatever'
        }
      }.to change(Item, :count).by(1)
      expect(response).to render_template(:show)
    end
  end

  describe 'show' do
    it 'displays successfully' do
      item = FactoryGirl.create(:item)
      get :show, id: item.id
      expect(response).to render_template(:show)
    end
  end
end
