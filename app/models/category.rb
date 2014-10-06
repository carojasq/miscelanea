class Category < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3, maximum: 100 },  uniqueness: true
	has_many :products
end
