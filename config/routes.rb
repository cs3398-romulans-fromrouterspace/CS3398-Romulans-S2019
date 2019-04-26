Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :groups
  resources :strengths
  resources :teams

  resources :groups do
    member do
      get :generate_teams
      patch :run_sort
    end
  end

  root 'groups#index'

  # for lets encrypt ssl cert
  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
