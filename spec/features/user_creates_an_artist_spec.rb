require 'rails_helper'

RSpec.feature "Artists" do
  context "Creating a new artist" do
    scenario "does not save anything to the database when attributes are invalid" do
      visit artists_path
      click_on 'New artist'

      fill_in "artist_name", with: ""
      fill_in "artist_image_path", with: ""
      click_on 'Create Artist'

      expect(page).to have_content "Name can't be blank"
      expect(Artist.count).to eq 0
    end

    scenario "saves it to the database when attributes are valid" do
      artist_name = "Robert Morely"
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

      visit artists_path
      click_on 'New artist'

      fill_in "artist_name", with: artist_name
      fill_in "artist_image_path", with: artist_image_path
      click_on 'Create Artist'

      artist = Artist.find_by(name: artist_name)
      expect(page).to have_current_path(artist_path(artist))
      expect(page).to have_content artist_name
      expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    end
  end
end
