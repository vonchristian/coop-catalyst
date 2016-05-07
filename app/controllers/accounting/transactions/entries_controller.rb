module Accounting
  module Transactions
    class EntriesController < ApplicationController
      def index
        @entries = Accounting::Transactions::Entry.all.order('created_at DESC')
      end

      def new
        @entry = Accounting::Transactions::Entry.new
        @entry.debit_amounts.build
        @entry.credit_amounts.build
      end

      def create
        @entry  = Entry.new(entry_params)
        # @entry.recorder = current_user
        if @entry.save
          # @entry.create_activity :create, owner: current_user, recipient: @entry
          redirect_to accounting_entry_url(@entry), notice: "Entry saved successfully."
        else
          render :new
        end
      end

      def show
        @entry = Entry.find(params[:id])
      end

      def edit
        @entry = Entry.find(params[:id])
        # authorize @entry
      end

      def update
        @entry = Entry.find(params[:id])
        # authorize @entry
        if @entry.update(entry_params)
          redirect_to accounting_entry_url(@entry), notice: "Entry updated successfully."
        else
          render :edit
        end
      end

      private
      def entry_params
        params.require(:accounting_transactions_entry).permit(:date, :reference_number, :description, credit_amounts_attributes:[:id, :amount, :account], debit_amounts_attributes:[:id, :amount, :account])
      end
    end
  end
end
