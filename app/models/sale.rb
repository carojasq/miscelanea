class Sale < ActiveRecord::Base
  belongs_to :seller
  has_many :order_lines
  has_many :products, through:  :order_lines
end
