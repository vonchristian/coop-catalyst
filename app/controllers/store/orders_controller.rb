class Store::OrdersController < ApplicationController
  layout 'store'
  def index
    @orders = Store::Order.all.order(:date_issued)
  end
  def new
    @cart = current_cart
      if @cart.line_items.empty?
        redirect_to store_index_url, notice: "Your cart is empty"
      return
    end
    @order = Store::Order.new
  end
  def create
    @order = Store::Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save!
        Store::Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to store_index_url, notice:
        'Thank you for your order.' }
        format.json { render json: @order, status: :created,
        location: @order }
      else
        @cart = current_cart
        format.html { render action: :new }
        format.json { render json: @order.errors,
        status: :unprocessable_entity }
      end
    end
  end

  def show
    @order = Store::Order.find(params[:id])
  end
  def destroy
    @cart = Store::Cart.find(params[:id])
    @cart.destroy
    redirect_to store_index_url
  end

  private
  def order_params
    params.require(:store_order).permit(:date_issued, :project_id, :customer_id, :customer_type, :payment_status,
      entry_attributes: [:description, :reference_number, :entriable_id, :entriable_type, :type, :date, :credit_amounts_attributes=> [:amount, :account], :debit_amounts_attributes=> [:amount, :account]])
  end
end
