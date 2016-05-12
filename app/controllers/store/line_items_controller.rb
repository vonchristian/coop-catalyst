 module Store
  class LineItemsController < ApplicationController
    layout "store"
    def create
      @cart = current_cart
      @line_item = @cart.line_items.create(line_item_params)
      respond_to do |format|
        if @line_item.save
          @cart.add_product
          format.html { redirect_to store_index_url }
          format.js   { @current_item = @line_item }
        else
          format.html { redirect_to store_index_url }
        end
      end
    end

  def destroy
    @cart = Store::LineItem.find(params[:id])
    @cart.destroy
    redirect_to store_index_url
  end

  private
  def line_item_params
    params.require(:store_line_item).permit(:product_id, :quantity)
  end
end
end
