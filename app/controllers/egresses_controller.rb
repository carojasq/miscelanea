class EgressesController < ApplicationController
before_action :authenticate_seller!, only: [:new,:create, :index]


  def new
  	@egress = Egress.new
  end

  def edit
  	@egress = Egress.find(params[:id])
  end

  def index 
    if seller_signed_in?
  	 @egresses = current_seller.egresses
    elsif admin_signed_in?
      @egresses = Egress.all
    end
  end

  def create
    @egress = Egress.new(egress_params)
    @egress.seller = current_seller
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
