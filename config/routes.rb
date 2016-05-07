Rails.application.routes.draw do
  devise_for :users
  namespace :accounting do
      resources :accounts, except:[:destroy],module: :accounts
  end
end
