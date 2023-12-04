Rails.application.routes.draw do
  devise_for :users

  # ... autres configurations de routes ...

  root to: "events#index"

  resources :events, only: ["show", "new", "create", "update"] do
    member do
      patch :set_interested
      patch :set_going
      patch :set_not_going
    end

    resources :surveys, only: ["new", "create"]
    resources :todo_lists, only: ["new", "create"]
    resources :user_events

    resource :chatroom, only: ["show", "create"]
  end


  resources :users, only: [:index] do
    get 'search', on: :collection
  end

  resources :surveys, only: ["show"] do
    resources :answers, only: ["create"]
  end

  resources :answers, only: [] do
    resources :user_answers, only: ["create", "destroy"]
  end

  resources :items, only: [] do
    resources :user_items, only: ["create", "destroy"]
  end

  resources :todo_lists, only: ["show"]
  resource :profiles, only: ["show"]

  resources :chatrooms, only: [:index]

  resources :chatrooms, only: [] do
    resources :messages, only: :create
  end

end
