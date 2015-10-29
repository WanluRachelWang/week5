Rails.application.routes.draw do

  root 'flights#index'

  resources :flights, only: [:index, :destroy]

end
