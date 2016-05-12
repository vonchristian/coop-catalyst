module Store
  class StocksController < ApplicationController
    def new
      @product = Store::Product.find(params[:product_id])
      @stock = @product.stocks.build
    end
    def create
      @product = Store::Product.find(params[:product_id])
      @stock = @product.stocks.create(stock_params)
      if @stock.save
        redirect_to store_product_path(@product), notice: "Stock added successfully."
      else
        render :new
      end
    end

    private
    def stock_params
      params.require(:store_stock).permit(:quantity, :date)
    end
  end
end
