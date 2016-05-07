module Accounting
  module Accounts
    class AccountsController < ApplicationController
      layout "accounting"
      def index
        @accounts = Accounting::Accounts::Account.all
      end

      def new
        @account = Accounting::Accounts::Account.new
      end

      def create
        @account = Accounting::Accounts::Account.create(account_params)
        if @account.save
          redirect_to accounting_account_url(@account), notice: "Account saved successfully."
        else
          render :new
        end
      end

      def show
        @account = Accounting::Accounts::Account.find(params[:id])
      end

      private
      def account_params
        params.require(:accounting_accounts_account).permit(:code, :name, :type)
      end
    end
  end
end
