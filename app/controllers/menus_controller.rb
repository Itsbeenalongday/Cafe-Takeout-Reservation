class MenusController < ApplicationController
  before_action :load_product, only: %i(show)
  def index
    @menu = ProductDescription.all
  end

  def show
  end

  def show_product
  end

  private

  def load_product
    @product = ProductDescription.find(params[:id])
  end
end
