class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    # if UserSession.find(params[:id]).nil?
    # if UserSession.where(group_id: params[:id]).where(user: current_or_guest_user).count == 0
    #  @user_session = UserSession.create(user: current_or_guest_user, group: @group, session: UserSession.where(group: @group).first.session)
    # else
    #  @user_session = UserSession.find(params[:id])
    # end

    # Find existing user session for this user and group
    @user_session = UserSession.find_by(group: @group, user: current_or_guest_user)

    # Create one if it doesn't exist
    if @user_session.nil?
      @user_session = UserSession.create(
        user: current_or_guest_user,
        group: @group,
        session: UserSession.where(group: @group).first.session
      )
    end

    # Load connected users for the lobby
    connected_user_ids = Rails.cache.fetch("lobby_#{@group.id}_users") { [] }
    @connected_users = User.where(id: connected_user_ids)

    # generate a qrcode
    @content = "https://musixboxx-50911a378c05.herokuapp.com/groups/#{@group.id}"
    @qr_svg = RQRCode::QRCode.new(@content).as_svg(
      module_size: 6,
      use_path: true
    )

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

  def update_pseudo
    @group = Group.find(params[:id])
    pseudo = params[:pseudo].to_s.strip

    if pseudo.present? && pseudo.length <= 15
      current_or_guest_user.update(pseudo: pseudo)

      # Broadcast le changement de pseudo à tous les joueurs du lobby
      ActionCable.server.broadcast(
        "lobby_#{@group.id}",
        {
          type: "pseudo_updated",
          user_id: current_or_guest_user.id,
          display_name: current_or_guest_user.display_name
        }
      )

      flash[:notice] = "Pseudo updated!"
    else
      flash[:alert] = "Pseudo must be between 1 and 15 characters"
    end

    redirect_to group_path(@group)
  end

end
