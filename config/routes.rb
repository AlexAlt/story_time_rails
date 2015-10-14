Rails.application.routes.draw do
  resources :stories do
    resources :images
  end
end
