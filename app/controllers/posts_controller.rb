class PostsController < ApplicationController
  def create
    post = current_user.posts.build(tweet:params[:post][:tweet])
    if(post.save)
      flash[:notice] = "New post created"
  else
    flash[:alert] = "Failed to post"
  end
  redirect_to current_user
  end

  def index
    @posts = current_user.posts
  end
  

  def destroy
    if(Post.find(params[:id]).destroy)
      flash[:notice] = "Successfully deleted the post"
    else
      flash[:alert] = "Cannot delete the post"
    end
    redirect_to posts_path
  end
  
  
end