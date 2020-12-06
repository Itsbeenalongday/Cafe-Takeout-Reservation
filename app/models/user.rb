class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  USER_COLUMNS = %i(name phone)
  has_many :orders , dependent: :destroy

  def get_cart
    order = self.orders.cart.first_or_create
  end

  def get_complete
    order = self.orders.complete.last
  end
end

