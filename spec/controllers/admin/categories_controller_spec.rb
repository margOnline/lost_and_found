require "rails_helper"

describe Admin::CategoriesController do
  
  describe "#index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'create' do
    describe "successfully" do
      it "saves the new category" do
        expect {post :create, category: { name: 'whatever' }
          }.to change(Category, :count).by(1)
        expect(response).to redirect_to admin_categories_url
      end
    end
    describe "with errors" do
      it "does not create a new category" do
        expect {post :create, category: { name: nil }
          }.to change(Category, :count).by(0)
        expect(response).to render_template(:new) 
      end
    end
  end

end
