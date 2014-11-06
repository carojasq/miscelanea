class ShoppingBasketsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:checkout, :edit, :show]


  def show
    @shopping_basket = current_user.shopping_basket # Find article by id
    @shopping_basket_total  = 0
    @shopping_basket.order_details.each do |ol|
      @shopping_basket_total += ol.quantity * ol.product.price
    end 
    @shopping_basket_subtotal = @shopping_basket_total / 1.16
    @shopping_basket_taxes = @shopping_basket_total - @shopping_basket_subtotal
  end

  def index 
  	@shopping_baskets = Order.all
  end

  def checkout  
    @shopping_basket = ShoppingBasket.find(params[:id])
    # Check existences
    continue = false
    @shopping_basket.order_details.each do |ol|
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
      @shopping_basket.order_details.each do |ol|
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
      @shopping_basket.order_details = []
      @shopping_basket.save
    end     

    redirect_to shopping_basket_path(@shopping_basket)
     
  end

end
