Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  
  get 'sessions/create'

  get 'sessions/destroy'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :issues do
        resources :comments
        resources :attachments, shallow: true
      end
    end
  end

  #get 'home/show'
  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :issues do
    resources :comments
    resources :attachments, shallow: true
  end


  root to: 'issues#index'
end
