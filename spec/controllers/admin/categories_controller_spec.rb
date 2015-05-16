require "rails_helper"

describe Admin::CategoriesController do

  context "admin user" do
    let(:user) { FactoryGirl.create( :user, :admin )}
    before { sign_in user }

    describe "#index" do
      it "renders the index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'create' do
      describe "successfully" do
        it "saves the new category" do
          expect {post :create, format: 'js', category: { name: 'whatever' }
            }.to change(Category, :count).by(1)
          expect(response).to be_success
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

  context "with signed in user, not admin" do
    let(:user) { FactoryGirl.create( :user )}
    before { sign_in user }

    describe "#index" do
      it "redirects to the home page" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe "#show" do
      it "redirects to the home page" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe "new" do
      it "redirects to the home page" do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    describe "create" do
      it "redirects to the home page" do
        post :create
        expect(response).to redirect_to root_url
      end
    end
  end

  context "with no one signed in" do
    describe "#index" do
      it "redirects to the home page" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe "#show" do
      it "redirects to the home page" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe "new" do
      it "redirects to the home page" do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    describe "create" do
      it "redirects to the home page" do
        post :create
        expect(response).to redirect_to root_url
      end
    end
  end

end
