class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists
  validates :title, :artist, presence: true, length: { minimum: 2 }
  validates :title, uniqueness: { :case_sensitive => false }
  validates :user_id, presence: true

  def song_added_count
    count = 0
    added_count_list_by_song = Playlist.group(:song_id).count
    added_count_list_by_song.each do |key, value|
      if key == self.id
        count = value
      end
    end
    return count
  end

  def playlist_count
    count = self.playlists.count
  end
end
