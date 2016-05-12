module Store
  class StoreController < ApplicationController
    layout "store"
    def index
      if params[:name].present?
        @products = Store::Product.search_by_name(params[:name])
      else
        @products = Store::Product.all
      end
      @cart = current_cart
      @line_item = Store::LineItem.new
  end
  end
end
