Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :products do
    resources :reviews, except: [:index]
  end
  get "search", :to => "products#index"
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
