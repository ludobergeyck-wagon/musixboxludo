class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    if UserSession.find(params[:id]).nil?
     @user_session = UserSession.create(user: current_or_guest_user, group: @group, session: UserSession.where(group: @group).first.session)
    else
     @user_session = UserSession.find(params[:id])
    end
  end

  def start
    @group = Group.find(params[:id])

    # Optional: mark group as started here if you want
    # group.update(started_at: Time.current)

    ActionCable.server.broadcast(
      "lobby_#{@group.id}",
      { type: "start_game" }
    )

    head :ok
  end


end
