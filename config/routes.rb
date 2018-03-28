Rails.application.routes.draw do


devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}


namespace :admins do
   get 'users/top' => 'users#top', as: 'top'
  resources :users
  resources :topics
  resources :contacts
end



  resources :users do
     member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  get 'topics/password' => 'topics#password', as: 'topic_password'
  get 'topics/top' => 'topics#top', as: 'top'
  resources :topics do
        member do
      post "add", to: "clips#create"
    end
        collection do
      post 'confirm'
    end
    resources :topic_goods, only: [:create, :destroy]
    resources :topic_bads, only: [:create, :destroy]
    resources :topic_comments, only: [:create, :destroy]
  end

  resources :tags
  resources :categories
  resources :clips, only: [:destroy]

  root 'topics#top'
end
