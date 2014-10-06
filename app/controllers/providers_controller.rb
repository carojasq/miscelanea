class ProvidersController < ApplicationController
 before_action :authenticate_admin!, only: [:new,:create, :edit, :update, :destroy]

  def new
  	@provider = Provider.new
  end

  def edit
  	@provider = Provider.find(params[:id])
  end

  def update
  	@provider = Provider.find(params[:id])
  	if @provider.update(provider_params)
  		@mensaje = "Proveedor actualizado exitosamente"
  		redirect_to providers_path
  	else 
  		@mensaje = "Introduzca los datos de la categoría a actualizar"
  		render 'edit'
  	end
  end

  def destroy
  	@provider = Provider.find(params[:id])
  	@provider.active = false
  	@provider.save
  	@mensaje = "Categoría marcada como inactiva"
  	redirect_to providers_path
  end

  def show
    @provider = Provider.find(params[:id]) # Find article by id
  end

  def index 
  	@providers = Provider.all
  end

  def create
  	@provider = Provider.new(provider_params)
  	if @provider.save 
  		@mensaje = "Categoría añadida con éxito"
  		redirect_to providers_path
  	else
  		@mensaje = "No se pudo almacenar categoría"
  		render 'new'
  	end
  end
  private
  def provider_params
  	  	puts params

     params.require(:provider).permit(:name, :telephone, :address)
  end
end
