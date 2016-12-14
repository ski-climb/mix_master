require 'rails_helper'

RSpec.feature "Artists" do
  context "deleting an artist" do
    scenario "removes that artist from the database" do
      artist_1 = create(:artist)
      tone_loc = create(:artist, name: "Tone Loc")
      artist_3 = create(:artist)
      visit artists_path

      within "#artist_#{tone_loc.id}" do
        click_on "Tone Loc"
      end
      click_on "Delete"

      expect(page).to have_current_path "/artists"
      expect(page).not_to have_content "Tone Loc"
      expect(Artist.count).to eq 2
      expect(Artist.pluck(:name)).not_to include("Tone Loc")
    end
  end
end
