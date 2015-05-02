require 'rails_helper'

describe HomepageController do
  describe "#index" do
    it "should display the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#about" do
    it "should display the about template" do
      get :about
      expect(response).to render_template(:about)
    end
  end

end