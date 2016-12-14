class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :artist

  def artist_name
    artist.name
  end
end
