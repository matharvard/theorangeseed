class PostsController < ApplicationController
  def index
    @posts = Post.find(:all, :limit => 25).group_by(&:day)
  end
  
  def show
    @post = Post.find(params[:id])
    @posts = Post.all(:conditions => {:created_at => @post.created_at.beginning_of_day..@post.created_at.end_of_day }).group_by(&:day)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:notice] = "Post was successfully destroyed."
    redirect_to(posts_path)
  end
end
