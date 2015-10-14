Rails.application.routes.draw do
  root 'stories#index'
  resources :stories do
    resources :images
  end
  resources :images do
    resources :sentences
  end
end
