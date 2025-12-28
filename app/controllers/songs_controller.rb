class SongsController < ApplicationController
  def search
  if params[:playlist_id].present?
    @playlist = Playlist.find(params[:playlist_id])
  elsif params.dig(:search, :playlist_id).present?
    @playlist = Playlist.find(params.dig(:search, :playlist_id))
  end
  
  query = params[:query] || params.dig(:search, :query)
  
  if query.present?
    @songs = ItunesService.search(query)
  else
    @songs = []
  end 
  end

  def create
      @playlist = Playlist.find(params[:playlist_id])
      @song = @playlist.songs.new(song_params)
    if @song.save
      redirect_to search_songs_path(playlist_id: @playlist.id, query: params[:query]), notice: "Song added!"
    else
      redirect_to search_songs_path(playlist_id: @playlist.id, query: params[:query]), alert: "Error adding song"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @playlist = @song.playlist
    @song.destroy
    redirect_to @playlist, notice: "Song removed!"
  end

  private 

  def song_params
    params.require(:song).permit(:title, :artist, :preview_url, :year)
  end
end