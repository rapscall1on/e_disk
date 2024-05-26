Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  
  
  delete  '/file_entries/:id/destroy', to: "file_entries#destroy", as: 'file_delete'
  patch '/file_entries/:id/edit', to: "file_entries#edit", as: 'file_edit'
  get 'file_entries/move', to: "file_entries#move"
  get 'file_entries/:id/move', to: "file_entries#move"
  post '/file_entries', to: "file_entries#create"

  patch '/directories/:id/edit', to: "directories#edit", as: 'directory_edit'

  devise_for :users
  
  resources :directories do
    resources :file_entries, shallow: true
    member do
      patch :move
      get :move
    end
  end

  resources :file_entries do
    member do
      patch :move
    end
  end  
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
