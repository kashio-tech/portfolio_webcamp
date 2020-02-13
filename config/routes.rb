Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "photos#index"
  resources :users,   only: [:index, :show, :edit, :update, :destroy] do
    member  do
      get 'show_map'
    end
  end
  resources	:photos,	only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :cameras, only: [:index, :create, :edit, :update, :destroy]
  resources :lenses,  only: [:index, :create, :edit, :update, :destroy]

  namespace :admin do
    root :to => 'users#index'
    resources :photos, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      patch :toggle_status
      member do
        get 'show_photo'
      end
    end
  end
end
