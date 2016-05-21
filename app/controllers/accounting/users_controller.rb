module Accounting
  class UsersController < ApplicationController
    layout "accounting"
    def index
      @users = User.all
    end
  end
end
