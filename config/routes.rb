SocMed::Engine.routes.draw do
  resource :likes, only: %i[create destroy]
  resources :follows, only: %i[create destroy]
  resources :blocks, only: %i[create destroy]
  resources :reports, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
end
