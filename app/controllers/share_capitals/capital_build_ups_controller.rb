module ShareCapitals
  class CapitalBuildUpsController < ApplicationController
    def new
      @share_capital = ShareCapital.find(params[:share_capital_id])
      @capital_build_up = @share_capital.capital_build_ups.build
      @capital_build_up.credit_amounts.build
      @capital_build_up.debit_amounts.build
    end

    def create
      @share_capital = ShareCapital.find(params[:share_capital_id])
      @capital_build_up = @share_capital.capital_build_ups.create(capital_build_up_params)
      if @capital_build_up.save
        redirect_to @share_capital, notice: "Capital Build Up transaction saved successfully."
      else
        render :new
      end
    end

    private
    def capital_build_up_params
      params.require(:accounting_transactions_capital_build_up).permit(:date, :reference_number, :description,
                    credit_amounts_attributes:[:id, :amount, :account],
                    debit_amounts_attributes:[:id, :amount, :account])
    end
  end
end
