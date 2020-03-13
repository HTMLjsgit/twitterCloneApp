Rails.application.routes.draw do
  get 'mypages/index'
  devise_for :users,controllers: { registrations: 'users/registrations' }
  get 'posts/index'
  root 'posts#index'
  resources :posts
  resources :mypages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
