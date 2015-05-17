class TagsController < ApplicationController

  def show
    @items = Item.tagged_with(params[:id])
    Rails.logger.info("\n\n ******** #{@items.count }******** \n\n")
  end
end