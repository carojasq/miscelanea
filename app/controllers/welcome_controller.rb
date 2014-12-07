class WelcomeController < ApplicationController
  def index
  	# Notificacion productos por agotarse
  	@products_warning = Product.check_existences
  end

end
