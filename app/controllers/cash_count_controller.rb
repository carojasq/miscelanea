class CashCountController < ApplicationController

	def show

		@sales = Sale.all
		@egresses = Egress.all

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
