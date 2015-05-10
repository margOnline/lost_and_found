class HomepageController < ApplicationController
  def index
    @items = Item.recent
  end
  
  def about
  end
end
