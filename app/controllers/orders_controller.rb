class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :load_product_description, only: %i(running_total)
  before_action :load_order, only: %i(create running_total select_product)
  #before_action :orderlineitem_params, only: %i(select_product)

  def index
    @product_descriptions = ProductDescription.all
  end

  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.total_price = 0
    @order.save
  end

  def select_product
    @oli = @order.order_line_items.new
    @oli.product_description_id = params[:product_id]
    @oli.quantity = params[:quantity]
    @order.total_price += ProductDescription.find_by(id: @oli.product_description_id).price * @oli.quantity
    @oli.save
    redirect_to orders_path
  end
  
  def update
  
  end
  
  def edit
  
  end
  
  def destroy
  
  end
  
  def show
  
  end

  private
  
  def order_params
    params.require(:order).permit(:status, :order_at, :total_price, :pickup_time, :user_id)
  end

  def load_product_description
    @pd = ProductDescription.find_by(id: params[:product_description_id])
  end

  def load_order
    @order = Order.find_by(id: params[:id])
  end
end
