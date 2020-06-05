SocMed::Engine.routes.draw do
  resources :likes, only: %i[create destroy]
  resources :follows, only: %i[create destroy]
  resources :blocks, only: %i[create destroy]
  resources :reports, only: %i[create destroy]
end
