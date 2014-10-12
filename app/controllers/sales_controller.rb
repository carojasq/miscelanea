class SalesController < ApplicationController

	def show 
		@sale = Sale.find(params[:id])
		@sale_total = @sale.order_lines.sum(:final_total_price)
        @sale_taxes = @sale_total * 0.16
        @sale_subtotal = @sale_total / 1.16
	end

	def index 
		@sales = Sale.all
	end

end
