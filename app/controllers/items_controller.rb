class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :setup_item, only: [:show, :edit, :update, :destroy]

  def index
    @lost_items = Item.lost_items.order(created_at: :desc).
      paginate(:page => params[:page], :per_page => 10)
    @found_items = Item.found_items.order(created_at: :desc).
      paginate(:page => params[:page], :per_page => 10)

  end

  def new
    @item = current_user.items.build
    @images = @item.images.build
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
    if @item.user == current_user
      render :edit
    else
      redirect_to new_user_session_url
    end
  end

  def update
    if @item.user == current_user
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was sucessfully updated.'
      else
        render action: 'edit'
      end
    else
      redirect_to new_user_session_url
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
    params.require(:item).permit(:description, :user_id, :state, :category_id,
      :tag_list, images_attributes: [:source_file])
  end
end
