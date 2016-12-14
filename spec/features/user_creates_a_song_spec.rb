
# given that artists exist in the database
# when I visit the artist songs index
# and I click on "New song"
# and I fill in the title
# and I click on "Create Song"
# then I should be on the song page
# and I should see a link to the song artist's individual page


require 'rails_helper'

RSpec.feature "Songs" do
  context "Creating a song" do
    scenario "when the attributes are valid the song is saved to the database" do
      artist = create(:artist)
      visit artist_path(artist)
      click_on "New song"

      expect(page).to have_current_path(new_artist_song_path(artist))

      fill_in "song_title", with: "Song Title"
      click_on "Create Song"

      song = Song.find_by(title: "Song Title")
      expect(page).to have_current_path(song_path(song))
      expect(page).to have_link artist.name, artist_path(artist)
    end

    scenario "when the attributes are invalid nothing is saved to the database" do
      artist = create(:artist)
      visit artist_path(artist)
      click_on "New song"

      expect(page).to have_current_path(new_artist_song_path(artist))

      fill_in "song_title", with: ""
      click_on "Create Song"

      expect(page).to have_content "Title can't be blank"
      expect(Song.count).to eq 0
    end
  end
end
