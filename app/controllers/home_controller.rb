class HomeController < ApplicationController
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
    @product = Product.create(
    :name => params[:product][:name],
    :quantity => params[:product][:quantity].to_i
    )

  end

  def delete
    Product.find(params[:product][:id].to_i).destroy
  end
end
