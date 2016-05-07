module Accounting
  class AccountsController < ApplicationController
    def index
      @accounts = Accounting::Account.all
    end

    def new
      @account = Accounting::Account.new
    end

    def create
      @account = Accounting::Account.create(account_params)
      if @account.save
        redirect_to accounting_account_url(@account), notice: "Account saved successfully."
      else
        render :new
      end
    end

    def show
      @account = Accounting::Account.find(params[:id])
    end

    private
    def account_params
      params.require(:accounting_account).permit(:code, :name, :type)
    end
  end
end
