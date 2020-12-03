class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :load_product_description, only: %i(running_total)
  before_action :load_order, only: %i(select_product show)
  #before_action :orderlineitem_params, only: %i(select_product)

  def index
  end

  def new
    @order = Order.new
    @order.user_id = current_user.id
    @order.total_price = 0
    @order.save
    redirect_to show_menu_order_path(@order.id)
  end

  def show_menu
    @product_descriptions = ProductDescription.all
  end

  def select_product
    @oli = @order.order_line_items.new
    @oli.product_description_id = params[:product_id]
    @oli.quantity = params[:quantity]
    @order.total_price += ProductDescription.find_by(id: @oli.product_description_id).price * @oli.quantity
    @oli.save
    @order.save
    redirect_to show_menu_order_path(@order.id)
  end

  def show;end
  
  def update
  
  end
  
  def edit
  
  end
  
  def destroy
  
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
