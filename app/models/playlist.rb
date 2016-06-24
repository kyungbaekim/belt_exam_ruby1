class Playlist < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :song_id, :user_id, presence: true

  def group_by_user
    playlist_of_the_song = Playlist.where(song_id: self.song_id)
    playlist_of_the_song_of_user = playlist_of_the_song.where(user_id: self.user_id)
    return playlist_of_the_song_of_user.count
  end
end
