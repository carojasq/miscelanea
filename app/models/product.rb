class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details
  validates :name, presence: true, length: { minimum: 3, maximum: 100 },  uniqueness: true
  validates_numericality_of :price,  more_than: 0 
  validates_numericality_of :stock,  more_than: 0 

end
