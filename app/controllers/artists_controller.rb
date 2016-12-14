class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = find_artist(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = find_artist(params[:id])
  end

  def update
    @artist = find_artist(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    artist = find_artist(params[:id])
    artist.destroy
    redirect_to artists_path
  end

  private 

    def artist_params
      params.require(:artist).permit(:name, :image_path)
    end
end
