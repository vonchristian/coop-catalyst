Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users", sessions: "users/sessions" }
  namespace :accounting do
      resources :accounts, except:[:destroy],module: :accounts
      resources :entries, except:[:destroy], module: :transactions
  end
  resources :users, except:[:destroy] do
    resources :share_capitals, only:[:new, :create, :show]
  end
    resources :share_capitals, only:[:show] do
      resources :capital_build_ups, only: [:new, :create], module: :share_capitals
    end

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

  namespace :human_resources do
    resources :employees, except:[:destroy]
    resources :settings, only:[:index]
    resources :roles, except:[:destroy]
  end
  namespace :store do
    resources :products, only:[:index, :new, :create, :show]
  end
  get '*path' => redirect('/')
end
