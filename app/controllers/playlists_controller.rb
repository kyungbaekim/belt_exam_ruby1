class PlaylistsController < ApplicationController
  before_action :require_login, only: [:index, :create]

  def index
  end

  def create
    playlist = Playlist.new(playlist_params)
    if playlist.save
      # do nothing
    else
      flash[:errors] = playlist.errors.full_messages
    end
    redirect_to '/songs'
  end

  private
    def playlist_params
      params.require(:playlist).permit(:song_id, :user_id)
    end
end
