Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users", sessions: "users/sessions" }
  namespace :accounting do
      resources :accounts, except:[:destroy],module: :accounts
      resources :entries, except:[:destroy], module: :transactions
  end
  resources :users

  namespace :members do
    resources :occupations
  end

  namespace :loans_section do
    resources :loan_products, only:[:index, :new, :create, :show]
    resources :users, only:[:index, :show] do
      resources :loans, only:[:new, :create]
    end
    resources :loans, only:[:show] do
      resources :approvals, only:[:new, :create]
    end
    resources :loans, except:[:destroy]
  end
  resources :roles
end
