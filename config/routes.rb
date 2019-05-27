Rails.application.routes.draw do

  post '/signin', to: 'admins#signin'
  get '/validate', to: 'admins#validate'
  get '/inventory', to: 'admins#inventory'

  resources :admins, :contacts, :products
end
