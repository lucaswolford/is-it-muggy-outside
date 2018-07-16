Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locations, only: [:new, :create]

  root to: 'locations#new'
end
