Rails.application.routes.draw do
  # Homepage
  root "about#home"

  # Administrivia
  get "terms",   to: "about#terms",   as: :terms
  get "privacy", to: "about#privacy", as: :privacy
end
