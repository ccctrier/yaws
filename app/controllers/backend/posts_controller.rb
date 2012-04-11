class Backend::PostsController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  def index
    @posts = Posts.All
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to backend_posts_path, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to backend_posts_url, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end
  
end
