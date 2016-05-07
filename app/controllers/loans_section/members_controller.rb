module LoansSection
  class MembersController < ApplicationController
    layout "loans_section"
    def index
      @users = User.all
    end
    def show
      @user = User.find(params[:id])
    end
  end
end
