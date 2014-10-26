class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new,:create, :edit, :update, :destroy]

  def new
  	@category = Category.new
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
  		@mensaje = "Categoría actualizada exitosamente"
  		redirect_to categories_path
  	else 
  		@mensaje = "Introduzca los datos de la categoría a actualizar"
  		render 'edit'
  	end
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.active = false
  	@category.save
  	@mensaje = "Categoría marcada como inactiva"
  	redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id]) # Find article by id
  end

  def index 
  	@categories = Category.all
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save 
  		@mensaje = "Categoría añadida con éxito"
  		redirect_to categories_path
  	else
  		@mensaje = "No se pudo almacenar categoría"
  		render 'new'
  	end
  end

  private
  def category_params
  	puts params
    params.require(:category).permit(:name, :description)
  end
end
