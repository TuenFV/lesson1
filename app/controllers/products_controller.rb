class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_paras)
    @product.category_id = id_category
    @product.save
    
    if @product.save
      flash.now[:notice] = 'Product was added successfully!'
      redirect_to products_path
    else
      flash.now[:error] = 'Can not add new product!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    
    if @product.update(product_params)
      flash[:notice] = "Sucess update!"
      redirect_to product_path
    else
      flash[:error] = "Can not update!"
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = 'Product was successfully destroyed.'
  end

  private
    def product_params
      product_params =  params.require(:product).permit(:name , :description, :stock, :price, :category_id, :cat_product )     
    end

    def id_category
      id_category = Category.find_by(name: @product.cat_product).id
    end

    def set_product
      @product = Product.find(params[:id])
    end
end