require 'rails_helper'

describe TagsController do
  describe "#show" do
    it 'displays successfully' do
      get :show, id: 'bag'
      expect(response).to render_template(:show)
    end
  end

end