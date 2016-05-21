class ShareCapitalsController  < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @share_capital = @user.build_share_capital
  end
  def create
    @user = User.find(params[:user_id])
    @share_capital = @user.build_share_capital(share_capital_params)
    if @share_capital.save
      redirect_to @user, notice: "Share Capital Account opened successfully."
    else
      render :new
    end
  end

  def show
    @share_capital = ShareCapital.find(params[:id])
  end

  private
  def share_capital_params
    params.require(:share_capital).permit(:date_opened, :account_number)
  end
end
