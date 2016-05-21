class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  def after_sign_in_path_for(current_user)
    if current_user.is_a?(User) && current_user.manager?
      accounting_accounts_url
    elsif current_user.is_a?(User) && current_user.project_engineer?
      projects_url
    elsif current_user.is_a?(User) && current_user.accounting_officer?
      accounting_petty_cash_index_url
    elsif current_user.is_a?(User) && current_user.monitoring_officer?
      monitoring_projects_url
    end
  end

  private
  def permission_denied
    redirect_to root_path, alert: 'You are not allowed to access this feature.'
  end
  def current_cart
    Supplies::Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Supplies::Cart.create
  end
end
