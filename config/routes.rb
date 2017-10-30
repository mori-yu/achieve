Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :blogs, only: [:index, :new, :create, :edit, :update ,:destroy ,:show] do
    resources :comments
      post :confirm, on: :collection
    end
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end
  
  resources :poems, only: [:index, :show]
  
  root 'top#index'
  get '/blogs/:id', to: 'blogs#destroy'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
