Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "events#index"
  resources :events, only: ["show", "new", "create"] do
    member do
      patch :set_interested
      patch :set_going
      patch :set_not_going
    end
    resources :surveys, only: ["new", "create"]
    resources :todo_lists, only: ["new", "create"]
    resources :user_events
  end
  resources :users, only: [:index] do
    get 'search', on: :collection
  end

  resources :surveys, only: ["show"]

  resources :answers, only: [] do
    resources :user_answers, only: ["create"]
  end

  resources :items, only: [] do
    resources :user_items, only: ["create"]
  end

  resources :user_answers, only: ["destroy"]
  resources :todo_lists, only: ["show"]
  resource :profiles, only: [:show]

end
