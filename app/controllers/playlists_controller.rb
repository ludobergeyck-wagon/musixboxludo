class PlaylistsController < ApplicationController

  before_action :authenticate_user!
  def index
    @playlists = Playlist.all
  end

  def user
    @user = current_user
  end

def show 
  @playlist = Playlist.find(params[:id])
end

def new 
  @playlist = Playlist.new
end

def create 
  @playlist = Playlist.new(playlist_params)
  @playlist.user = current_user
  if @playlist.save
    redirect_to @playlist, notice: "Playlist created!"
  else 
    render :new
  end
end 

 def destroy
  @playlist = Playlist.find(params[:id])
  @playlist.destroy
  redirect_to my_playlists_path, notice: "Playlist deleted!"
 end

def my_playlists
  @playlists = current_user.playlists
end 

 private 
  def playlist_params
  params.require(:playlist).permit(:title)
  end
end 
