class UserSessionsController < ApplicationController

  def show
    @user_session = current_or_guest_user.user_sessions.find(params[:id])

    Song.where(playlist: @playlist).each do |song|
      Question.create(session_id: @user_session.session_id, song: song )
    end

    raise
    
    if params[:current_question]
      @next_question = Question.where(session_id: @user_session.session_id).where("id > ?", params[:current_question]).first
      @question = @next_question
    else
      @question = Question.where(session_id: @user_session.session_id).first
    end
    
  end

end
