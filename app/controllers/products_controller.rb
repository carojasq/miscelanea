class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new,:create, :edit, :update, :destroy]

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		@mensaje = "Producto actualizado exitosamente"
  		redirect_to products_path
  	else 
  		@mensaje = "Introduzca los datos de la producto a actualizar"
  		render 'edit'
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.active = false
  	@product.save
  	@mensaje = "Producto marcado como inactiva"
  	redirect_to products_path
  end

  def show
    @product = Product.find(params[:id]) # Find article by id
  end

  def index 
  	@products = Product.all
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save 
  		@mensaje = "Producto añadida con éxito"
  		redirect_to products_path
  	else
  		@mensaje = "No se pudo almacenar producto"
  		render 'new'
  	end
  end

  private
  def product_params
  	puts params
    params.require(:product).permit(:name, :description, :price, :quantity, :category_id, :provider_id)
  end
end
