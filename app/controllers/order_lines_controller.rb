class OrderLinesController < ApplicationController
	def new
		@orderline = OrderLine.new
	end

	def create 
		@order = Order.find(params[:order_id])
		@order_line = @order.order_lines.create(order_line_params)
		redirect_to order_path(@order)
	end

	def edit
		@order_line = OrderLine.find(params[:id])
	end

	def update
		@order_line = OrderLine.find(params[:id])
		@order = @order_line.order
		if @order_line.update(order_line_params)
			redirect_to @order_line.order
		else
			render 'edit'
		end
	end

	def destroy
		@order = Order.find(params[:order_id])
		@order_line = @order.order_lines.find(params[:id])
		@order_line.destroy
		redirect_to order_path(@order)
	end

	private
	def order_line_params
		params.require(:order_line).permit(:product_id, :quantity)
	end

end
