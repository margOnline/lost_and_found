require 'rails_helper'

describe ItemsController do
  let(:user) { FactoryGirl.create(:user) }
  
  context "with signed in user" do 
    before { sign_in user }
    
    describe "#new" do
      it "should display the new form" do
        get :new
        expect(response).to render_template(:new)
      end
    end
  
    describe 'create' do
      it 'success - with a description' do
        expect{ post :create, item: {
          description: 'whatever'
          }
        }.to change(Item, :count).by(1)
      end

      it 'success - with a category' do
        expect{ post :create, item: {
          category_id: 1
          }
        }.to change(Item, :count).by(1)
      end

      it 'success - with tags' do
        expect{ post :create, item: {
          tag_list: ['tag1', 'tag2']
          }
        }.to change(Item, :count).by(1)
      end
    end

    describe "edit" do
      describe "an item belonging to the signed in user" do
        it "displays the edit form" do
          item = FactoryGirl.create(:item, user_id: user.id)
          get :edit, id: item.id, item: { description: 'new description'}
          expect(response).to render_template(:edit)
        end
      end
      
      describe "an item belonging to another user" do
        it "redirects to the sign in page" do
          new_user = FactoryGirl.create(:user)
          item = FactoryGirl.create(:item, user: new_user)
          get :edit, id: item.id, item: { description: 'new description'}
          expect(response).to redirect_to new_user_session_url
        end
      end
    end

    describe "update" do
      describe "an item belonging to the signed in user" do
        it "updates the item" do
          item = FactoryGirl.create(:item, user_id: user.id)
          patch :update, id: item.id, item: { description: 'new description'}
          expect(item.reload.description).to eq "new description"
        end
      end
      
      describe "an item belonging to another user" do
        it "redirects to the sign in page" do
          new_user = FactoryGirl.create(:user)
          item = FactoryGirl.create(:item, user: new_user)
          patch :update, id: item.id, item: { description: 'new description'}
          expect(response).to redirect_to new_user_session_url
        end
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

  context "with user not signed in" do 
    
    describe "#new" do
      it "redirects to the login form" do
        get :new
        expect(response).to redirect_to new_user_session_url
      end
    end
  
    describe "create" do
      it "redirects to the login form" do
        post :create, item: { description: 'whatever' }
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "edit" do
      it "redirects to the login form" do
        item = FactoryGirl.create(:item, user_id: user.id)
        put :edit, id: item.id, item: { description: 'new description'}
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "destroy" do
      it "redirects to the login form" do
        item = FactoryGirl.create(:item, user_id: user.id)
        delete :destroy, id: item.id
        expect(response).to redirect_to new_user_session_url
      end
    end
  end


  describe 'show' do
    it 'displays successfully' do
      item = FactoryGirl.create(:item, user_id: user.id)
      get :show, id: item.id
      expect(response).to render_template(:show)
    end
  end

end
