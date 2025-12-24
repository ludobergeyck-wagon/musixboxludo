class ProfilesController < ApplicationController
  def show
    @games_played = current_user.user_sessions.count
    @total_score = current_user.user_sessions.sum(:score)
    @best_score = current_user.user_sessions.maximum(:score)
    @average_score = current_user.user_sessions.average(:score)
  end
end
