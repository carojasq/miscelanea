class ShoppingBasket < ActiveRecord::Base
  belongs_to :user
  has_many :order_details
  has_many :products, through:  :order_details

 def self.checkout
 end
 
end