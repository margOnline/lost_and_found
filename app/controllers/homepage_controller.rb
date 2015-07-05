class HomepageController < ApplicationController
  def index
    @items = Item.recent
  end
  
  def about
  end

  def slice
    @items = Item.all
  end
end
