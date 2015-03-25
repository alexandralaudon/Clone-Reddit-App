Rails.application.routes.draw do

  root 'posts#index'

  get "sign-up", to: "registrations#new"


  resources :posts, only: [:show]

end
