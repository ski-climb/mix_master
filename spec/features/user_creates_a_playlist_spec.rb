require 'rails_helper'

RSpec.feature "Playlists" do
  context "creating a playlist" do
    scenario "saves the playlist and displays the song titles" do
      song_1, song_2, song_3 = create_list(:song, 3)
      playlist_name = "Tone's list"

      visit playlists_path
      click_on "New Playlist"

      fill_in 'playlist_name', with: playlist_name
      check("song-#{song_1.id}")
      check("song-#{song_3.id}")
      click_on "Create Playlist"

      playlist = Playlist.find_by(name: playlist_name)
      expect(page).to have_current_path playlist_path(playlist)
      expect(page).to have_content playlist_name
      expect(page).to have_content song_1.title
      expect(page).not_to have_content song_2.title
      expect(page).to have_content song_3.title
      within("li:first") do
        expect(page).to have_link song_1.title, href: song_path(song_1)
      end
      within("li:last") do
        expect(page).to have_link song_3.title, href: song_path(song_3)
      end
    end
  end
end
