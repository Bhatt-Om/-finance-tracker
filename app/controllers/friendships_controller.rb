class FriendshipsController < ApplicationController

  def index
  end
  def create    
    friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
    if friendship.save
      flash[:notice] = "Start following"
      redirect_to my_friends_path
    else
      flash[:error] = friendship.errors.full_messages.join(", ").to_s
      redirect_to my_friends_path
    end
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end

  # private

  # def friendship_params
  #   params.require(:friendship).permit(user_id: , friend_id:)
  # end
end