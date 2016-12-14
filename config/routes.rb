Rails.application.routes.draw do
  root 'hello#hello'

  resources :artists
end
