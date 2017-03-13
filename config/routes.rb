Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root :to => "users#current"

  get "/artists", :controller => "users", :action => "artist_dummy"
  get "/artists/:artist", :controller => "users", :action => "artist"
  # Routes for the Song_instance resource:
  # CREATE
  get "/song_instances/new", :controller => "song_instances", :action => "new"
  post "/create_song_instance", :controller => "song_instances", :action => "create"

  # READ
  get "/song_instances", :controller => "song_instances", :action => "index"
  get "/song_instances/:id", :controller => "song_instances", :action => "show"

  # UPDATE
  get "/song_instances/:id/edit", :controller => "song_instances", :action => "edit"
  post "/update_song_instance/:id", :controller => "song_instances", :action => "update"

  # DELETE
  get "/delete_song_instance/:id", :controller => "song_instances", :action => "destroy"
  #------------------------------

  # Routes for the Song resource:
  # CREATE
  get "/songs/new/:playlist_id", :controller => "songs", :action => "new"
  post "/create_song", :controller => "songs", :action => "create"

  # READ
  get "/songs", :controller => "songs", :action => "index"
  get "/songs/:id/:playlist_id", :controller => "songs", :action => "show"

  # UPDATE
  get "/songs/:id/edit", :controller => "songs", :action => "edit"
  post "/update_song/:id", :controller => "songs", :action => "update"

  # DELETE
  get "/delete_song/:id", :controller => "songs", :action => "destroy"
  #------------------------------

  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  # Routes for the Playlist resource:
  # CREATE
  get "/playlists/new", :controller => "playlists", :action => "new"
  post "/create_playlist", :controller => "playlists", :action => "create"

  # READ
  get "/playlists", :controller => "playlists", :action => "index"
  get "/playlists/:id", :controller => "playlists", :action => "show"

  # UPDATE
  get "/playlists/:id/edit", :controller => "playlists", :action => "edit"
  post "/update_playlist/:id", :controller => "playlists", :action => "update"

  # DELETE
  get "/delete_playlist/:id", :controller => "playlists", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  get "/following", :controller => "users", :action =>"following_index"
  get "/followers", :controller => "users", :action =>"followers_index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
