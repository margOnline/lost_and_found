class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
        redirect_to @item, notice: 'item was sucessfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :description, :user_id)
  end
end
