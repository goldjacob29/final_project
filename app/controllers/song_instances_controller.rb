class SongInstancesController < ApplicationController
  def index
    @q = SongInstance.ransack(params[:q])
    @song_instances = @q.result(:distinct => true).includes(:playlist, :song).page(params[:page]).per(10)

    render("song_instances/index.html.erb")
  end

  def show
    @song_instance = SongInstance.find(params[:id])

    render("song_instances/show.html.erb")
  end

  def new
    @song_instance = SongInstance.new

    render("song_instances/new.html.erb")
  end

  def create
    @song_instance = SongInstance.new

    @song_instance.song_id = params[:song_id]
    @song_instance.playlist_id = params[:playlist_id]

    save_status = @song_instance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/song_instances/new", "/create_song_instance"
        redirect_to("/song_instances")
      else
        redirect_back(:fallback_location => "/", :notice => "Song instance created successfully.")
      end
    else
      render("song_instances/new.html.erb")
    end
  end

  def edit
    @song_instance = SongInstance.find(params[:id])

    render("song_instances/edit.html.erb")
  end

  def update
    @song_instance = SongInstance.find(params[:id])

    @song_instance.song_id = params[:song_id]
    @song_instance.playlist_id = params[:playlist_id]

    save_status = @song_instance.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/song_instances/#{@song_instance.id}/edit", "/update_song_instance"
        redirect_to("/song_instances/#{@song_instance.id}", :notice => "Song instance updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Song instance updated successfully.")
      end
    else
      render("song_instances/edit.html.erb")
    end
  end

  def destroy
    @song_instance = SongInstance.find(params[:id])

    @song_instance.destroy

    if URI(request.referer).path == "/song_instances/#{@song_instance.id}"
      redirect_to("/", :notice => "Song instance deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Song instance deleted.")
    end
  end
end
