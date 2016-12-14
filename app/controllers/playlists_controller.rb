class PlaylistsController < ApplicationController

  def index
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    playlist = Playlist.create(playlist_params)
    redirect_to playlist_path(playlist)
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name, song_ids: [])
    end
end
