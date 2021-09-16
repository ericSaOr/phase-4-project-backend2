Rails.application.routes.draw do
  resources :bakeries
  resources :reviews
  resources :users
  get "first", to: "users#cookiejar"
  get "second", to: "users#tummy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "signup", to: "users#create"
end
