Rails.application.routes.draw do
  resources :teams
  resources :projects

  devise_for :users


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :projects
  resources :teams
  resources :users

  root 'hello#index'

  get 'ps1_zerodiv', to: 'hello#zerodiv', as: 'zerodiv'

  get 'ps1_scrape', to: 'hello#scrape', as: 'scrape'

  get 'quotations', to: 'hello#quotations', as: 'quotations'

  post 'quotations', to: 'hello#quotations', as: 'quotations_post'

  get 'searchpage', to: 'hello#searchpage', as: 'quotations_search'

  get 'ps2_solutions', to: 'hello#ps2_solutions', as: 'ps2_sol'

  get 'ps3', to: 'hello#ps3', as: 'ps3'

  get 'ps4', to: 'hello#ps4', as: 'ps4'

  get 'ps5', to: 'hello#ps5', as: 'ps5'

  get 'ps6', to: 'hello#ps6', as: 'ps6'


  get 'admin_panel', to: 'hello#admin_panel', as: 'admin_panel'
  post 'admin_panel', to: 'hello#admin_panel', as: 'admin_panel_post'


end
