class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  before_create :set_default_role
  has_many :egresses
  has_many :sales
  has_one :order

  private
  def set_default_role
    self.role ||= Role.find_by_name('Vendedor')
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
