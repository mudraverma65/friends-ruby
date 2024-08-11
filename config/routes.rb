Rails.application.routes.draw do
  get 'memes/index'
  	devise_for :users
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  #   end

  resources :friends
  # get 'home/index'
  root 'home#index'
  get 'friends#index'

  resources :memes, only: [:index]
  get 'memes/new_meme', to: 'memes#new_meme', as: :new_meme
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
