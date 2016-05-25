Rails.application.routes.draw do
  devise_for :users

  root to: 'contacts#index'
  get '/list' => 'contacts#index'

  get '/list/new' => 'contacts#new'
  post '/list' => 'contacts#create'

  get '/list/:id' => 'contacts#show'

  get '/list/:id/edit' => 'contacts#edit'
  patch '/list/:id' => 'contacts#update'

  delete '/list/:id' => 'contacts#destroy'
end
