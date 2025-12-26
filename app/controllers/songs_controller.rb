class SongsController < ApplicationController
  def search
    if params[:query].present?
  @songs = ItunesService.search_by_genre(params[:query])
    else
  @songs = []
    end 
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @song = @playlist.songs.new(song_params)
    if song.save
        redirect_to @playlist, notice: "Song added!"
    else
        redirect_to @playlist, alert: "Error adding song"
    end

  end

  def destroy
    @song = Song.find(params[:id])
    @playlist = @song.playlist
    @song.destroy
    redirect_to @playlist, notice: "Song removed!"
  end
end

private 

 def song_params
   params.require(:song).permit(:title, :artist, :preview_url, :year)
 end
