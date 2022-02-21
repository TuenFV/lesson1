class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(para_category)
    @category.save
    
    if @category.save
      flash[:notice] = 'Success!'
      redirect_to admin_categories_path
    else
      flash[] = 'Error!'
      render 'new'
    end
    
  end

  def edit
  end

  def update
    
    @category.update(para_category)
    redirect_to admin_category_path
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def para_category
      para_category = params.require(:category).permit(:name, :description)
    end
end
