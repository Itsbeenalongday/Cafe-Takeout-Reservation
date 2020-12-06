class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :load_product_description, only: %i(add_to_cart)
  before_action :load_order, only: %i(select_product show)
  before_action :load_cart, only: %i(new cart_menu add_to_cart remove_from_cart)
  #before_action :orderlineitem_params, only: %i(select_product)

  def index
    @product_descriptions = ProductDescription.all
  end

  def new
    #여기서 결제 정보 로직 연결 후 
    # 결제 완료 페이지로 이동(COMPLETE.html.erb)
    # 결제 완료 페이지에서 간략한 정보 출력 ui 신경 X
    # 주문 정보랑, 결제 금액 정도만 간략히 보여주도록, 내가 작업할 수 있게
    @cart.update(total_price: @cart.line_item_total, order_at: Time.now)
    redirect_to complete_orders_path
  end

  def complete;end 
  
  def cart_menu 
    @line_items = @cart.order_line_items
  end 

  def add_to_cart
    if @cart.present?
      @cart.order_line_items.create(product_description_id: @product.id, quantity: 1, total: @product.price, evaluable: false)
    end 
    redirect_back(fallback_location: root_path)
  end 

  def remove_from_cart
    if @cart.present?
      OrderLineItem.find_by(product_description_id: params[:product_description_id]).destroy
    end
    redirect_back(fallback_location: root_path)
  end 

  private

  def load_cart
   @cart = current_user.get_cart
  end 
  
  def order_params
    params.require(:order).permit(:status, :order_at, :total_price, :pickup_time, :user_id)
  end

  def load_product_description
    @product = ProductDescription.find_by(id: params[:product_description_id])
  end

  def load_order
    @order = Order.find_by(id: params[:id])
  end
end
