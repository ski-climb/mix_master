require 'rails_helper'

RSpec.feature "Playlist" do
  context "editing a playlist" do
    scenario "saves the new playlist" do
      playlist = create(:playlist, name: "Philly Jim")
      song_1, song_2, song_3, song_4 = create_list(:song, 4)
      playlist.songs << song_1
      playlist.songs << song_2
      playlist.songs << song_3
      visit playlist_path(playlist)
      click_on 'Edit'

      expect(find_field('playlist_name').value).to eq "Philly Jim"
      expect(find_field(song_1.title).checked?).to be true
      expect(find_field(song_2.title).checked?).to be true
      expect(find_field(song_3.title).checked?).to be true
      expect(find_field(song_4.title).checked?).to be false

      fill_in 'playlist_name', with: "NEW PLAYLIST NAME"
      uncheck song_2.title
      check song_4.title
      click_on 'Save'

      expect(page).to have_content "NEW PLAYLIST NAME"
      expect(page).to have_content song_1.title
      expect(page).to have_content song_3.title
      expect(page).to have_content song_4.title
      expect(page).not_to have_content song_2.title
    end
  end
end
