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
    
    if @category.save
      flash[:notice] = 'Category was successfully created!'
      redirect_to admin_category_path(@category)
    else
      flash[:alert] = @category.errors.full_messages
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
  end

  def update
    if @category.update(params_category)
      flash[:notice] = "Category was sucessfully updated!"
      redirect_to admin_category_path
    else
      flash[:alert] = @category.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category was sucessfully destroyed!"
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
