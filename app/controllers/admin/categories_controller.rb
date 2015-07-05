class Admin::CategoriesController < AdminController
  layout "admin"

  before_action :all_categories, only: [:index, :create]

  def index
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
     
    if @category.save
      respond_to do |format|
        format.html
        format.js 
      end
    else
      flash[:error] = "Correct the errors as indicated"
      render :new
    end
  end

  private
  def categories_params
    params.require(:category).permit(:name)
  end

  def all_categories
    @categories = Category.all
  end

end