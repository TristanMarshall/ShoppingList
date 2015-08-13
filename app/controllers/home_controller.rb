class HomeController < ApplicationController

  ##before any user accesses a resource
  ## we filter out those that are not logged in 
  before_filter :authorize

  def index
    #list all of my products
    @products = Product.all
  end

  def new
    # creat a new product
    @product = Product.new
  end

  def create
    puts params
    #POST request
    #save that model
    @product = Product.create(product_params)
  end

  def delete
    puts params
    Product.find(params[:product][:id].to_i).destroy
  end

  private
  ## private functions that ONLY home controller can use
  def product_params
    params.require(:product).permit(:name, :quantity)
  end

end
