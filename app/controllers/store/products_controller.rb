module Store
  class ProductsController < ApplicationController
    layout "store"
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

    def edit
      @product = Store::Product.find(params[:id])
    end

    def update
      @product = Store::Product.find(params[:id])
      @product.update(product_params)
      if @product.save
        redirect_to store_product_url(@product), notice: "Product update successfully."
      else
        render :edit
      end
    end
    
    private
    def product_params
      params.require(:store_product).permit(:name, :description, :unit, :price, stocks_attributes:[:date, :quantity])
    end
  end
end
