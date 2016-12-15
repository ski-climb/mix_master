PlaylistSong.destroy_all
Playlist.destroy_all
Song.destroy_all
Artist.destroy_all

15.times do
  name = Faker::StarWars.character
  image_path = "https://robohash.org/#{name}"
  Artist.create(name: name, image_path: image_path)
end

all_artists = Artist.all
8.times do
  all_artists.each do |artist|
    artist.songs << Song.create(title: Faker::Book.title)
  end
end

12.times do
  Playlist.create(name: Faker::StarWars.vehicle)
end

all_playlists = Playlist.all
all_songs = Song.all

all_playlists.each do |playlist|
  9.times do
    playlist.songs << all_songs.sample
  end
end
