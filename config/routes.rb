Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {registrations: "users/registrations"}

  resources :ideas do
    resources :assignments
    resources :suggestions
  end

end
