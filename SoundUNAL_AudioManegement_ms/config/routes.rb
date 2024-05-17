Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # API
  # Songs request
  resources :songs
  get '/show_by_title', to: 'songs#show_by_title'
  # Albums request
  resources :albums
  # Playlists request
  resources :playlists
  # Tags request
  resources :tags
  # Song_playlists request => info canciones de cada playlist
  resources :song_playlists
  # Tags_songs request => info canciones de cada genero
  resources :tag_songs
  # Tags_albums request => info albums de cada genero
  resources :tag_albums
  # Contributors request => info contribuidores de playlists
  resources :contributors do
    collection do
      get 'playlists_by_user'
    end
    member do
      get 'playlist_by_user'
    end
  end
end
