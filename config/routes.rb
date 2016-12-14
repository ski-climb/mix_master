Rails.application.routes.draw do
  root 'hello#hello'

  resources :artists do
    resources :songs, only: [:new, :create]
  end
  resources :playlists, only: [:index, :new, :create, :show]

  resources :songs, only: [:show]
end
