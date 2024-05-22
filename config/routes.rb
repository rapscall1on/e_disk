Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  
  get 'file_entries/index'
  get 'file_entries/new'
  get 'file_entries/create'
  get 'file_entries/edit'
  get 'file_entries/update'
  delete  '/file_entries/:id/destroy', to: "file_entries#destroy", as: 'file_delete'
  # get 'file_entries/destroy'
  get 'file_entries/download'
  get 'file_entries/share'

  post '/file_entries', to: "file_entries#create"

  get 'directories/index'
  get 'directories/new'
  get 'directories/create'
  get 'directories/edit'
  get 'directories/update'
  get 'directories/destroy'
  devise_for :users
  
  resources :directories do
    resources :file_entries, shallow: true
  end

  resources :file_entries
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
