class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  USER_COLUMNS = %i(name phone)
  has_many :orders

  def get_cart
    order = self.orders.cart.first_or_create
  end 
end

