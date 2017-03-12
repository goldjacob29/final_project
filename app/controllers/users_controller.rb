class UsersController < ApplicationController
  def index
    if search = params[:search]
      @users = User.where('username LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%").page(params[:page]).per(10)
    else
      @users = User.page(params[:page]).per(10)
    end
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
