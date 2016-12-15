class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = find_playlist(params[:id])
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    playlist = Playlist.create(playlist_params)
    redirect_to playlist_path(playlist)
  end

  def edit
    @playlist =  find_playlist(params[:id])
    @songs = Song.all
  end

  def update
    @playlist = find_playlist(params[:id])
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  private

    def playlist_params
      params.require(:playlist).permit(:name, song_ids: [])
    end

    def find_playlist(id)
      Playlist.find(id)
    end
end
