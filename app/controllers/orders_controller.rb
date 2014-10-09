class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id]) # Find article by id
  end

  def index 
  	@orders = Order.all
  end

  def pagado  
  	@order = Order.find(params[:id])
  	if @order.paid
  		puts "Ya fue pagado"
  	else
  		@order.paid = true
  		@order.save
  	end
  end

end
