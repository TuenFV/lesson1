class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    @category.save
    
    if @category.save
      flash[:notice] = 'Success!'
      redirect_to admin_categories_path
    else
      flash.now[:error] = @category.errors.full_message
      render 'new'
    end
    
  end

  def edit
  end

  def update
    if @category.update(params_category)
      flash[:notice] = "Sucess update!"
      redirect_to admin_category_path
    else
      flash.now[:error] = @category.errors.full_message
      render :edit
    end
  end

  def show
  end

  def destroy
    @category.destroy
    flash.now[:notice] = "Category was sucessfully destroyed!"
    redirect_to admin_categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def params_category
      params_category = params.require(:category).permit(:name, :description)
    end
end