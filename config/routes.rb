Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users do
    resources :categories do
      resources :expenses
    end
  end
end
