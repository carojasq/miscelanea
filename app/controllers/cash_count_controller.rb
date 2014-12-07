class CashCountController < ApplicationController

	def show
		if request.post?
			#@sales = Sale.where("created")
			#@egresses = Egress.all
			@sales = Sale.where("created_at > ? AND created_at < ?", params[:sale][:from_date], params[:sale][:to_date] )
			@egresses = Egress.where("created_at > ? AND created_at < ?", params[:sale][:from_date], params[:sale][:to_date] )
		else
			@sales = Sale.all
			@egresses = Egress.all
		end

		begin
			sales_total = @sales.sum(:value)
		# No results
		rescue
			sales_total = 0
		end
		begin
			egresses_total = @egresses.sum(:value)
		rescue
			egresses_total = 0
        end
		@total = sales_total - egresses_total

	end


end
