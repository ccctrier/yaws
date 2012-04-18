class Backend::PostsController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  before_filter :check_section_param
  
  def index 
    @posts = Post.where(:published => true, :section => params[:section])
    
    respond_to do |format|
      format.html
    end    
  end
  
  def new 
    @post = Post.new
    @post.section = params[:section]
    
    respond_to do |format|
      format.html
    end
    
  end
  
  def create
    @post = Post.new(params[:post])    
    @post.published_at = Time.now if @post.published & @post.published_at.nil?
    
    if @post.save
      redirect_to backend_posts_path(:section => @post.section), :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.published_at = Time.now if @post.published & @post.published_at.nil?
    
    if @post.update_attributes(params[:post])
      redirect_to backend_posts_url, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end
  
  private
  
    def check_section_param
      raise "No section specified!" if params[:section].nil?
      raise "Wrong section specified!" unless ["news", "blog"].include?(params[:section])
    end
  
end
