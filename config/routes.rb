Rails.application.routes.draw do
  namespace :accounting do
      resources :accounts, except:[:destroy],module: :accounts
  end
end
