Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "photos#index"
  resources :users,   only: [:index, :show, :edit, :update]
  resources	:photos,	only: [:new, :create, :index, :show, :edit, :update]

end
