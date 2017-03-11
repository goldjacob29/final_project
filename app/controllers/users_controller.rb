class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def current
    @user = current_user
    render("show")
  end

  def artist
    @artist = params[:artist]

  end

  def artist_dummy
    artist = params[:artist]
    artists = RSpotify::Artist.search(artist)
    @s_artist = artists.first
    redirect_to("/artists/#{@s_artist.name}")

  end

end
