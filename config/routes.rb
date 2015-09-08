Rails.application.routes.draw do
  root "problems#index"
  resources :problems
end
