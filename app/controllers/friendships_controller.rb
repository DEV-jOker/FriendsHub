class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  def create
    @friend = User.find(params[:id])
    Friendship.create(user_id:current_user.id,friend_id:@friend.id)
    respond_to do |format|
      format.js { render "users/friendship_button" }
    end
  end

  def destroy
    @friend = User.find(params[:id])
    Friendship.find_by(user_id:current_user.id,friend_id:@friend.id).delete
    respond_to do |format|
      format.js { render 'users/friendship_button' }
    end
  end
  
end