Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :products do
    resources :reviews
  end
end
