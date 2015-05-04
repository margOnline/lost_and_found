class ItemsController < ApplicationController
  before_action :setup_item, only: [:show, :edit, :update, :destroy]

  def index
    @lost_items = Item.lost_items.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    @found_items = Item.found_items.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was sucessfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url
  end

  def show
  end

  private
  def setup_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:image, :description, :user_id)
  end
end