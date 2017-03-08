class OrderConfirmationsController < ApplicationController

  def edit
    order = Order.find_by id: params[:order_id]
    user = User.find_by email: params[:email]
    if check_valid(user, order)
      order.confirm
      login user
      flash[:success] = t "success.order_shipping"
      redirect_to user
    else
      flash[:danger] = t "error.invalid_order"
      redirect_to root_path
    end
  end

  private

  def check_valid user, order
    user && user.id == order.user_id && order && order.order_status_id == 1 && order.authenticated?(:confirmation, params[:id])
  end
end
