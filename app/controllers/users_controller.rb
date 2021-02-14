class UsersController < ApplicationController
  def show
    @user = (params[:id])? User.find(params[:id]) : current_user
  end

  def index
    @search_string = params[:q]
    @users = User.search_users(@search_string)
  end
  
  
end