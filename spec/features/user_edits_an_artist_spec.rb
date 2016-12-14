require 'rails_helper'

RSpec.feature "Artists" do
  context "editing an artist" do
    scenario "doesn't save the new information to the database when invalid" do
      create(:artist, name: "artist name")
      artist = Artist.find_by(name: "artist name")
      visit artist_path(artist)
      click_on "Edit"

      expect(find_field('artist_name').value).to eq artist.name
      expect(find_field('artist_image_path').value).to eq artist.image_path

      fill_in "artist_name", with: ""
      click_on "Save"

      expect(page).to have_content "Name can't be blank"
      expect(Artist.find(artist.id).name).to eq "artist name"
    end

    scenario "saves the new information to the database when valid" do
      create(:artist, name: "artist name")
      artist = Artist.find_by(name: "artist name")
      visit artist_path(artist)
      click_on "Edit"

      expect(find_field('artist_name').value).to eq artist.name
      expect(find_field('artist_image_path').value).to eq artist.image_path

      fill_in "artist_name", with: "NEW NAME"
      click_on "Save"

      expect(page).to have_content "NEW NAME"
      expect(page).to have_css "img[src=\"#{artist.image_path}\"]"
      expect(Artist.find(artist.id).name).to eq "NEW NAME"
    end
  end
end
