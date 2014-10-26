class EgressesController < ApplicationController
 
  before_action :authenticate_user!, only: [:new,:create, :index]

  def new
  	@egress = Egress.new
  end

  def edit
  	@egress = Egress.find(params[:id])
  end

  def index 
    if user_signed_in?
      if current_user.role.name=="Vendedor" 
  	   @egresses = current_user.egresses
      elsif current_user.role.name=="Administrador" 
        @egresses = Egress.all
      end
    end

  end

  def create
    puts user_signed_in?
    puts current_user
    @egress = Egress.new(egress_params)
    @egress.user = current_user
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
