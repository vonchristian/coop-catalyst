module LoansSection
  class LoanProductsController < ApplicationController
    layout "loans_section"
    def index
      @loan_products = LoansSection::LoanProduct.all
    end
    def new
      @loan_product = LoansSection::LoanProduct.new
      @loan_product.build_interest_rate
    end

    def create
      @loan_product = LoansSection::LoanProduct.create(loan_product_params)
      if @loan_product.save
        redirect_to loans_section_loan_product_url(@loan_product), notice: "created successfully."
      else
        render :new
      end
    end

    def show
      @loan_product = LoansSection::LoanProduct.find(params[:id])
    end

    private
    def loan_product_params
      params.require(:loans_section_loan_product).permit(:name, :term, interest_attributes:[:rate, :recurrence])
    end
  end
end
