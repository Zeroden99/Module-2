class ProductsController < ApplicationController
  before_action :authenticate_user!
 before_action :find_product, only: [:show, :edit, :update, :destroy]

  
  
  def new
    @product = Product.new
  end
  
  def create
    @product = current_user.products.build(product_params)
    if @product.save
      
      redirect_to root_path
    else
      render 'new'
    end  
  end
  
  def show
    
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render 'edit'
    end
    
  end
  
  def destroy
    @product.destroy
    redirect_to root_path
  end
  
private

  def product_params
    params.require(:product).permit(:user_id, :title, :decription, :price)
  end
  
  def find_product
    @product = Product.find_by(id: params[:id])
end
end
