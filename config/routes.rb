Rails.application.routes.draw do
  resources :eventts
  root "eventts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
