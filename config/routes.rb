Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'

  resources :lists, only: [:new, :create, :show] do
    resources :bookmarks, only: [:create, :new, :show]
    # resources :bookmarks, only: [:index, :new, :create, :show]
  end
  # resources :bookmarks, only: [:destroy]
  # index, new, delete, show
  # get list 42

  # Defines the root path route ("/")
  # root "articles#index"
end
