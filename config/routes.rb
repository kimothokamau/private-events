Rails.application.routes.draw do
  root "eventts#index"
  resources :eventts do
    member do
      post 'attend', to: 'invitations#create'
      delete 'unattend', to: 'invitations#destroy'
    end
  end

  resources :users

  get 'sessions/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
