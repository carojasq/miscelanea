class OrderDetail < ActiveRecord::Base
  belongs_to :shopping_basket
  belongs_to :product
  belongs_to :sale

  validates_numericality_of :quantity, only_integer: true, greater_than: 0
  validates_presence_of :product, :quantity
  def total_price
  	product.price * quantity
  end

  def to_s
  	"#{product.name} Q: #{quantity}"
  end
end
