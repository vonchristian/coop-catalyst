Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users", sessions: "users/sessions" }
  authenticated :user do
  root :to => 'users#index', :constraints => lambda { |request| request.env['warden'].user.nil? }, as: :unauthenticated_root
end

  root :to => 'monitoring/projects#index', :constraints => lambda { |request| request.env['warden'].user.role == 'monitoring_officer' if request.env['warden'].user }, as: :monitoring_root
  root :to => 'members#index', :constraints => lambda { |request| request.env['warden'].user.role == 'project_engineer' if request.env['warden'].user }, as: :projects_root
  root :to => 'accounting/accounts#index', :constraints => lambda { |request| request.env['warden'].user.role == 'accounting_officer' if request.env['warden'].user }, as: :accounting_root

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

  resources :store, only:[:index], module: :store

  namespace :store do
    resources :products, only:[:index, :new, :create, :show, :edit, :update] do
      resources :stocks, only: [:new, :create]
    end
    resources :line_items, only: [:new, :create, :destroy]
    resources :carts, only: [:show, :destroy]
    resources :orders, only: [:index, :new, :create]
  end
  get '*path' => redirect('/')
end
