Rails.application.routes.draw do
  get 'dashboard/index'
  # Auth
  devise_for :user,
             path:        "/",
             path_names:  {
               confirmation: "confirm",
               password:     "reset",
               registration: "register",
               sign_in:      "signin",
               sign_up:      "signup",
               sign_out:     "signout"
             },
             controllers: {
               sessions: "users/sessions"
             }

  devise_scope :user do
    get "signup",  to: "devise/registrations#new"
    get "signin",  to: "devise/sessions#new"
    get "signout", to: "devise/sessions#destroy"
    get "forgot",  to: "devise/passwords#new"

    get "settings/account", to: "devise/registrations#edit", as: :account_settings
  end

  # Homepage for not signed-in users
  unauthenticated do
    root "home#index"
  end

  # Homepage for signed-in users
  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  # Profile
  get '@:username', to: 'users#show', as: :profile
  get 'users/:id',  to: redirect('profile')
  get 'profile',    to: 'users#show'

  # Users
  resources :users, only: :update
  get 'settings',               to: redirect('settings/profile'), as: :settings
  get 'settings/adult-content', to: 'settings#adult_content',     as: :adult_content_settings
  get 'settings/birthday',      to: 'settings#birthday',          as: :birthday_settings
  get 'settings/profile',       to: 'settings#profile',           as: :profile_settings

  # Administrivia
  get "terms",   to: "about#terms",   as: :terms
  get "privacy", to: "about#privacy", as: :privacy
end
