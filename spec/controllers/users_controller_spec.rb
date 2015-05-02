require 'rails_helper'

describe UsersController do

  describe "#new" do
    it "should display the new form" do
      get :new
      expect(response).to render_template(:new)
    end
  end
      
end