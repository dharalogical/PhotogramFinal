Rails.application.routes.draw do
  get 'posts/index'
  root to: 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index]
  resources :posts
  get 'edit_user_profile', to: 'users#edit', as: :edit_user_profile
  get 'users/:user_name', to: 'users#show', as: :user_show
  get 'users/:user_name/liked_photos', to: 'users#liked_photos', as: :liked_photos
end
