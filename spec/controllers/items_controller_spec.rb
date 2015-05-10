require 'rails_helper'

describe ItemsController do
  let(:user) { FactoryGirl.create(:user) }
  describe "#new" do
    it "should display the new form" do
      sign_in user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'create' do
    it 'success - with a description' do
      sign_in user
      expect{ post :create, item: {
        description: 'whatever'
        }
      }.to change(Item, :count).by(1)
    end

    it 'success - with a category' do
      sign_in user
      expect{ post :create, item: {
        category_id: 1
        }
      }.to change(Item, :count).by(1)
    end

    it 'success - with tags' do
      sign_in user
      expect{ post :create, item: {
        tag_list: ['tag1', 'tag2']
        }
      }.to change(Item, :count).by(1)
    end
  end

  describe 'show' do
    it 'displays successfully' do
      sign_in user
      item = FactoryGirl.create(:item, user_id: user.id)
      get :show, id: item.id
      expect(response).to render_template(:show)
    end
  end

  describe 'destroy' do
    it 'displays successfully' do
      sign_in user
      item = FactoryGirl.create(:item, user_id: user.id)
      delete :destroy, id: item.id
      expect(response).to redirect_to items_url
    end
  end
end
