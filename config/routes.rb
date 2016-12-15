Rails.application.routes.draw do
  root 'hello#hello'

  resources :artists do
    resources :songs, only: [:new, :create]
  end
  resources :playlists, except: [:delete]

  resources :songs, only: [:show]
end
