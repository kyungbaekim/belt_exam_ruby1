class SongsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    @songs = Song.all
  end

  def create
    song = Song.new(song_params)
    if song.save
      # do nothing
    else
      flash[:errors] = song.errors.full_messages
    end
    redirect_to '/songs'
  end

  def show
    @song = Song.find(params[:id])
    @playlist = @song.playlists
    @user_list = Playlist.group(:user_id).where(song_id: params[:id]).includes(:user)
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy if song.user == current_user
    redirect_to '/songs'
  end

  private
    def song_params
      params.require(:song).permit(:title, :artist, :user_id)
    end
end
