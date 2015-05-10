class Admin::CategoriesController < ApplicationController
  layout "admin"
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to admin_categories_url
    else
      flash[:error] = "Correct the errors as indicated"
      render :new
    end
  end

  private
  def categories_params
    params.require(:category).permit(:name)
  end


end