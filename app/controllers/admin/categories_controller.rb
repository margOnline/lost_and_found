class Admin::CategoriesController < AdminController
  layout "admin"

  before_action :all_categories, only: [:index, :create]
  before_action :setup_category, only: [:show, :edit, :update]

  def index
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(categories_params)
    authorize @category
     
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

  def destroy
    if @category.destroy
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private
  def categories_params
    params.require(:category).permit(:name)
  end

  def setup_category
    @category = Category.find(categories_params)
    authorize @category
  end

  def all_categories
    @categories = Category.all
  end

end