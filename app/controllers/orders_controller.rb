class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new,:checkout, :edit, :show]


  def show
    @order = current_user.order # Find article by id
    @order_total  = 0
    @order.order_details.each do |ol|
      @order_total += ol.quantity * ol.product.price
    end 
    @order_subtotal = @order_total / 1.16
    @order_taxes = @order_total - @order_subtotal
  end

  def index 
  	@orders = Order.all
  end

  def checkout  
    @order = Order.find(params[:id])
    # Check existences
    continue = false
    @order.order_details.each do |ol|
      if ol.product.quantity >= ol.quantity
        continue = true
      else
        continue = false
        puts "There are not existences"
        break 
      end   
    end
    # Creates sale and updates existences
    total_price = 0
    if continue
      @sale = Sale.new
      @sale.user = current_user
      @order.order_details.each do |ol|
        ol.final_unit_price = ol.product.price
        ol.final_total_price = ol.product.price * ol.quantity
        total_price += ol.final_total_price
        ol.product.quantity -= ol.quantity
        ol.product.save
        ol.save
        @sale.order_details << ol
      end
      @sale.value = total_price
      @sale.save
    end     

    redirect_to order_path(@order)
    @order.order_details = [] 
  end

end
