require 'rails_helper'

RSpec.describe Song, type: :model do
  it { is_expected.to validate_presence_of(:title) }

  describe "#artist_name" do
    it "returns the artist's name for that song" do
      artist = create(:artist, name: "Tom Thumb")
      song = create(:song, artist: artist)

      expect(song.artist_name).to eq "Tom Thumb"
    end
  end
end
