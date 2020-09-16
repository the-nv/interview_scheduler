Rails.application.routes.draw do
  get 'homepage/index'

  resources :candidates do
    resources :interviews
  end

  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
