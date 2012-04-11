class Backend::PostsController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  def index 
    raise "No section specified!" if params[:section].nil? 
    @posts = Post.where(:published => true, :section => params[:section])
    
    respond_to do |format|
      format.html
    end    
  end
  
  def new 
    raise "No section specified!" if params[:section].nil?
    raise "Wrong section specified!" unless ["news", "blog"].include? params[:section]
    
    @post = Post.new
    @post.section = params[:section]    
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to backend_posts_path, :section => @post.section, :notice => "Successfully created post."
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
