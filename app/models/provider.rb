class Provider < ActiveRecord::Base	
	has_many :products
	validates :name, presence: true, length: { minimum: 3, maximum: 100 },  uniqueness: true
	validates :telephone, presence: true, length: { minimum: 7, maximum: 10 },  format: { with: /[0-9]+/ , message: "Solo se permiten números" }
	validates :address, presence: true, length: { minimum: 3, maximum: 100 }
end
