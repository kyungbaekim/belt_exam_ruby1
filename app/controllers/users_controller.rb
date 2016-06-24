class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @songs = Song.where(user_id: params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      session[:user_name] = user.full_name
      redirect_to '/songs'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
