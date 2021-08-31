Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books
  resources :users
end