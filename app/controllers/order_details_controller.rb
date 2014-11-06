class OrderDetailsController < ApplicationController
	def new
		@order_detail = OrderDetail.new
	end

	def create 
		@shopping_basket = ShoppingBasket.find(params[:shopping_basket_id])
		@order_detail = @shopping_basket.order_details.create(order_detail_params)
		redirect_to shopping_basket_path(@shopping_basket)
	end

	def edit
		@order_detail = OrderDetail.find(params[:id])
	end

	def update
		@order_detail = OrderDetail.find(params[:id])
		@shopping_basket = @order_detail.shopping_basket
		if @order_detail.update(order_detail_params)
			redirect_to @order_detail.shopping_basket
		else
			render 'edit'
		end
	end

	def destroy
		@shopping_basket = Order.find(params[:shopping_basket_id])
		@order_detail = @shopping_basket.order_details.find(params[:id])
		@order_detail.destroy
		redirect_to shopping_basket_path(@shopping_basket)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:product_id, :quantity)
	end

end
