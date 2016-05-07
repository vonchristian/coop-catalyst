module LoansSection
  class UsersController < ApplicationController
    layout "loans_section"
    def index
      @users = User.all
    end
    def show
      @user = User.find(params[:id])
    end
  end
end
