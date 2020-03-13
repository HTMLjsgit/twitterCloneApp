Rails.application.routes.draw do
  devise_for :users,controllers: { registrations: 'users/registrations' }
  resources :users ,only: [:show,:update, :edit]
  get 'mypages/index'
  # たすけてえええええええええええええええええええええええええ
  get 'posts/index'
  root 'posts#index'
  resources :posts
  resources :mypages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
