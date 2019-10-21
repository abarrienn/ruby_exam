Rails.application.routes.draw do
	
  get 'adds/create'

  get 'adds/destroy'

  get 'songs/index'

  get 'songs/create'

  get 'songs/destroy'

  get "users/show/:id" => 'users#display'

  get 'users/new'=> 'users#new'
  get 'users/:id' => 'users#show'
  get 'users/edit/:id' => 'users#edit'
  get 'sessions/new' => 'sessions#new'
  post 'users/create' => 'users#create'
  post 'sessions/create'
  delete 'sessions/:id' => 'sessions#destroy'
  delete 'users/:id'=> 'users#destroy'
  patch 'users/:id' => 'users#update'

  post "songs/create" => 'songs#create'
  get "songs/:id" => 'songs#index'
  post "users/adds/:id/create" => 'adds#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
