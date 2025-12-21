class SessionsController < ApplicationController

  def new
    @playlists = Playlist.all
    @session = Session.new
    
    @playlist_groups = {
      "🎸 Genres" => Playlist.where(title: ["Rock", "Pop", "Jazz", "Blues", "Soul", "Funk", "Disco", "Metal", "Indie", "Punk", "Electronic", "Reggae", "Country", "Latin", "K-Pop", "Classic", "World", "Rap FR", "Rap US", "Hip Hop", "R'n'b"]),
      "📅 Decades" => Playlist.where(title: ["60s Hits", "70s Hits", "80s Hits", "90s Hits", "2000s Hits", "Oldies", "Motown"])
    }
  end

  def year_range_from_filter(filter)
    case filter
    when "2020s" then 2020..2029
    when "2010s" then 2010..2019
    when "2000s" then 2000..2009
    when "90s"   then 1990..1999
    when "80s"   then 1980..1989
    when "70s"   then 1970..1979
    else nil
    end
  end

  def create
    @session = Session.new(session_params)
    @playlist = @session.playlist
    
    if @session.save
      year_range = year_range_from_filter(params[:session][:year_filter])
      
      songs = Song.where(playlist_id: @playlist.id)
      if year_range
        songs = songs.where(year: year_range.map(&:to_s))
      end
      
      songs.shuffle.first(@session.number_of_questions).each do |song|
        Question.create(session_id: @session.id, song: song)
      end

      @user_session = UserSession.create!(
        user:    current_or_guest_user,
        session: @session,
        group: Group.create
      )

      if params[:mode] == "match"
        redirect_to group_path(@user_session.group_id)
      else
        redirect_to play_session_path(@user_session)
      end

    else
      @playlists = Playlist.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:playlist_id, :number_of_questions)
  end

end