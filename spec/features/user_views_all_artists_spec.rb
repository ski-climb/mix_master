require 'rails_helper'

RSpec.feature "Artists" do

  context "Viewing all artists" do
    scenario "displays all artists' information" do
      artist_1, artist_2, artist_3 = create_list(:artist, 3)
      visit artists_path

      expect(page).to have_content artist_1.name
      expect(page).to have_content artist_2.name
      expect(page).to have_content artist_3.name
    end

    scenario "provides links to the show page for each artist" do
      create(:artist, name: "Tone Loc")
      visit artists_path
      tone_loc = Artist.find_by(name: "Tone Loc")
      click_on "Tone Loc"

      expect(page).to have_current_path "/artists/#{tone_loc.id}"
      expect(page).to have_content 'Tone Loc'
      expect(page).to have_css("img[src=\"#{tone_loc.image_path}\"]")
    end
  end
end
