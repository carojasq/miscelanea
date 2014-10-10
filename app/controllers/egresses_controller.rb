class EgressesController < ApplicationController
  def new
  	@egress = Egress.new
  end

  def edit
  	@egress = Egress.find(params[:id])
  end

  def index 
  	@egresses = Egress.all
  end

  def create
    @egress = Egress.new(egress_params)
  	if @egress.save 
  		@mensaje = "Documento añadido con éxito"
  		redirect_to egresses_path
  	else
  		@mensaje = "No se pudo almacenar categoría"
  		render 'new'
  	end
  end

  private
  def egress_params
     params.require(:egress).permit(:description, :value)
  end

end
