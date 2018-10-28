Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'devise/sessions', 
        registrations: 'devise/registrations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'books#about'

  get 'books/about' 
  root to: 'books#top'
  patch '/books/:id'=> 'books#update', as:'update_books'
   resources :books
  	resources :favarorites, only: [:create, :destroy]
  	resources :users, only: [:show, :edit, :update, :index]
end