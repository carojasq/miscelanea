class SalesController < ApplicationController
    
    before_action :authenticate_seller!, only: [:index]

	def show 
		@sale = Sale.find(params[:id])
		@sale_total = @sale.order_lines.sum(:final_total_price)
        @sale_taxes = @sale_total * 0.16
        @sale_subtotal = @sale_total - @sale_taxes
	end

	def index 
		@sales = current_seller.sales
	end

end
