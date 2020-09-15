Rails.application.routes.draw do
  get 'homepage/index'

  resources :candidates

  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
