require 'rails_helper'

describe UsersController do

  describe "#new" do
    it "should display the new form" do
      user = User.new
      get :new
      expect(assigns(:user)).to eq user
      expect(response).to render_template(:new)
    end
  end
      
end