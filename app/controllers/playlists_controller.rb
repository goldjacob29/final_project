class PlaylistsController < ApplicationController
  before_action :current_user_must_be_playlist_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_playlist_user
    playlist = Playlist.find(params[:id])

    unless current_user == playlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.playlists.ransack(params[:q])
      @playlists = @q.result(:distinct => true).includes(:user, :song_instances).page(params[:page]).per(10)

    render("playlists/index.html.erb")
  end

  def show
    @song_instance = SongInstance.new
    @playlist = Playlist.find(params[:id])

    render("playlists/show.html.erb")
  end

  def new
    @playlist = Playlist.new

    render("playlists/new.html.erb")
  end

  def create
    @playlist = Playlist.new

    @playlist.name = params[:name]
    @playlist.user_id = params[:user_id]
    @playlist.description = params[:description]
    @playlist.share = params[:share]

    save_status = @playlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/playlists/new", "/create_playlist"
        redirect_to("/playlists/#{@playlist.id}")
      else
        redirect_back(:fallback_location => "/", :notice => "Playlist created successfully.")
      end
    else
      render("playlists/new.html.erb")
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])

    render("playlists/edit.html.erb")
  end

  def update
    @playlist = Playlist.find(params[:id])

    @playlist.name = params[:name]
    @playlist.user_id = params[:user_id]
    @playlist.description = params[:description]
    @playlist.share = params[:share]

    save_status = @playlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/playlists/#{@playlist.id}/edit", "/update_playlist"
        redirect_to("/playlists/#{@playlist.id}", :notice => "Playlist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Playlist updated successfully.")
      end
    else
      render("playlists/edit.html.erb")
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])

    @playlist.destroy

    if URI(request.referer).path == "/playlists/#{@playlist.id}"
      redirect_to("/", :notice => "Playlist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Playlist deleted.")
    end
  end
end
