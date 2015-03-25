Rails.application.routes.draw do

  root 'posts#index'

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"


  resources :posts, only: [:show]

end
