class OrdersController < ApplicationController
  before_action :logged_in_user

  def create
    @order = current_user.orders.build order_params
    if SaveOrderService.new(@order, current_cart, current_user).save_order?
      flash[:info] = t "success.order_success"
      redirect_to carts_path
    else
      flash_slq_error @order
    end
  end

  def show
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] t "error.order_not_found"
      redirect_to :back
    end
  end

  private

  def order_params
    params.require(:order).permit :order_status_id, :address, :address, :phone,
      :full_name
  end

  def flash_slq_error object
    flash[:danger] = object.errors.full_messages
    redirect_to root_url
  end
end
