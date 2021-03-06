class EgressesController < ApplicationController
 
  before_action :authenticate_user!, only: [:new,:create, :index]

  def new
  	@egress = Egress.new
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
    @egress = Egress.new(egress_params)
    @egress.user = current_user
  	if @egress.save 
  		redirect_to egresses_path
  	else
  		render 'new'
  	end
  end

  private
  def egress_params
     params.require(:egress).permit(:description, :value)
  end

end
