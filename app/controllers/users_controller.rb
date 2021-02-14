class UsersController < ApplicationController
  def show
    @user = (params[:id])? User.find(params[:id]) : current_user
    @posts = (current_user==@user)?@user.feed : @user.posts
    @post = @user.posts.new
  end

  def index
    @search_string = params[:q]
    @users = User.search_users(@search_string)
  end
  
  
end