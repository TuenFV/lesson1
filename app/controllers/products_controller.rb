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
    @product.category_id = cat_id
    @product.save
    
    if @product.save
      flash.now[:notice] = 'Product was added successfully!'
      redirect_to products_path
    else
      flash.now[:error] = 'Erorr!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_paras)
    if @product.update(product_paras)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to product_path
    else
      flash[:warning] = 'Erorr!'
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = 'Product was successfully destroyed.'

  end

  private
    def product_paras
      product_paras =  params.require(:product).permit(:name , :description, :stock, :price, :category_id, :cat_product )     
    end

    def cat_id
      cat_id = Category.find_by(name: @product.cat_product).id
    end

    def set_product
      @product = Product.find(params[:id])
    end


end
