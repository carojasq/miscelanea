class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details
  validates :name, presence: true, length: { minimum: 3, maximum: 100 },  uniqueness: true
  validates_numericality_of :price,  more_than: 0 
  validates_numericality_of :stock,  more_than: 0 


  def self.check_existences(limit=4)
  	products = Product.all
  	report_products = products.select{|p| p.stock<=limit}
  	if report_products.empty?
  		return false
  	else
  		return report_products
  	end
  end
end
