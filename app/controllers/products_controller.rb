class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def show
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t "error.product_not_found"
      redirect_to root_url
    end
  end
end
