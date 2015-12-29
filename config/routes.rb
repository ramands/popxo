Rails.application.routes.draw do

  root :to => 'playlists#index'
  resources :playlists
  resources :tracks
  
end
