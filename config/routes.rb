Rails.application.routes.draw do
  resources :comments
  #get '/articles', to:'articles#index'
  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'

  resources :articles, only: %i[index show create]
  #resources :articles, only: [:index]

end
