class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category
  validates :name, presence: true, length: { minimum: 3, maximum: 100 },  uniqueness: true
  validates_numericality_of :price,  more_than: 0 
  validates_numericality_of :quantity,  more_than: 0 

end
