Rails.application.routes.draw do
  resources :orders
  get 'generate_report' =>"orders#generate_report"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
