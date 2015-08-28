class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new
    @order_item.product_id = params[:order_item][:product_id]
    @order.update_order_totals
    respond_to do |format|
      flash.now[:success] = "Product is added in cart successfully!"
      format.html { redirect_to @product }
      format.js
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.update_order_totals
    @order_products = @order.products
    respond_to do |format|
      flash.now[:danger] = "Product is removed from cart successfully!"
      format.html { redirect_to @product }
      format.js
    end
  end

  def check_coupon
    @coupon = Coupon.where(token: params[:token]).first

    respond_to do |format|
      if @coupon && @coupon.active
        flash.now[:success] = "Coupon is valid! You got the discount."
        format.html { redirect_to root_path }
        format.js
      else
        flash.now[:danger] = "Coupon is invalid!"
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end
