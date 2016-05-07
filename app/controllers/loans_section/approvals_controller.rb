module LoansSection
  class ApprovalsController < ApplicationController
    def new
      @loan = LoansSection::Loan.find(params[:loan_id])
      @approval = @loan.approvals.build
    end

    def create
      @loan = LoansSection::Loan.find(params[:loan_id])
      @approval = @loan.approvals.create(approval_params)
      if @approval.save
        redirect_to loans_section_loan_url(@loan), notice: "Loan approved successfully."
      else
        render :new
      end
    end

    private
    def approval_params
      params.require(:loans_section_approval).permit(:date)
    end
  end
end 
