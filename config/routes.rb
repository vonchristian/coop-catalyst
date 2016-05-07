Rails.application.routes.draw do
  namespace :accounting do
    resources :accounts, except:[:destroy]
  end
end
