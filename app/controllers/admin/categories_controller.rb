class Admin::CategoriesController < AdminController
  layout "admin"
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      respond_to do |format|
        format.html { }
        format.js { }
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


end