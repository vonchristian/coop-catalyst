module Store
  class ProductsController < ApplicationController
    def index
      @products = Store::Product.all
    end

    def new
      @product = Store::Product.new
      @product.stocks.build
    end

    def create
      @product = Store::Product.create(product_params)
      if @product.save
        redirect_to store_product_path(@product), notice: 'Product created successfully.'
      else
        render :new
      end
    end

    def show
      @product = Store::Product.find(params[:id])
    end

    private
    def product_params
      params.require(:store_product).permit(:name, :description, :unit, :price, stocks_attributes:[:date, :quantity])
    end
  end
end
