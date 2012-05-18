class Backend::PostsController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  before_filter :check_section_param, :except => [:update, :create, :edit, :destroy]
  
  def index 
    @posts = Post.where(:section => params[:section])
    
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
    @post.user_id = current_user.id
    
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

    if @post.update_attributes(params[:post])
      redirect_to backend_posts_path(:section => @post.section), :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @Post = Post.find(params[:id])
    @Post.destroy
  
    respond_to do |format|
      format.html { redirect_to backend_posts_path(:section => 'news') }
      format.json { head :no_content }
    end
  end
  
  private
  def check_section_param
    @sections = Section.all
    @sectionnames = Array.new

    @sections.each do |section|
      @sectionnames << section.name.downcase
    end
    
    raise "No section specified!" if params[:section].nil?
    raise "Wrong section specified!" unless @sectionnames.include?(params[:section])
  end

end
