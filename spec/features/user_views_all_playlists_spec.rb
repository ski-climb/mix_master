require 'rails_helper'

RSpec.feature "Playlists" do
  context "viewing all playlists" do
    scenario "displays all playlists in the database" do
      playlist_1, playlist_2 = create_list(:playlist, 2)
      playlists = Playlist.all
      playlists.each do |playlist|
        10.times { playlist.songs << create(:song) }
      end
      visit playlists_path

      expect(page).to have_content playlist_1.name
      expect(page).to have_content playlist_2.name
      expect(page).to have_link playlist_1.name, href: playlist_path(playlist_1)
      expect(page).to have_link playlist_2.name, href: playlist_path(playlist_2)
    end
  end
end
