class TagsController < ApplicationController

  def show
    @items = Item.tagged_with(params[:id])
  end
end