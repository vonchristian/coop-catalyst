module LoansSection
  class LoansController < ApplicationController
    layout "loans_section"
    def index
      @loans = Loan.all
    end

    def new
      @user = User.find(params[:user_id])
      @loan = @user.loans.build
    end

    def create
      @user = User.find(params[:user_id])
      @loan = @user.loans.create(loan_params)
      if @loan.save
        redirect_to loans_section_loan_url(@loan), notice: "Loan created successfully."
      else
        render :new
      end
    end

    def show
      @loan = LoansSection::Loan.find(params[:id])
    end

    private
    def loan_params
      params.require(:loans_section_loan).permit(:date, :amount, :loan_product_id)
    end
  end
end
