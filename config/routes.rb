Rails.application.routes.draw do
  get 'users/show'
  resources :users ,only: [:show,:update, :edit]
  devise_for :users,controllers: { registrations: 'users/registrations' }
  get 'mypages/index'
  # get 'user/:id' => 'users#show'
  # たすけてえええええええええええええええええええええええええ
  get 'posts/index'
  root 'posts#index'
  resources :posts
  resources :mypages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
