class Egress < ActiveRecord::Base
	OPTIONS = ['Retiro de caja', 'Gasto ocasional', 'Pago proovedor']
	validates_inclusion_of :description, :in => OPTIONS
	belongs_to :seller
	belongs_to :admin
end
