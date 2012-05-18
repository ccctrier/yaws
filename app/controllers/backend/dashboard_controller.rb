class Backend::DashboardController < ApplicationController
  layout "backend/bootstrap"
  
  def index
    authorize! :read, @backend
    
    @news = Post.where(:section => 'news').order("updated_at DESC").limit(10)
    @blogposts = Post.where(:section => 'blog').order("updated_at DESC").limit(10)
    @events = Event.order("updated_at DESC").limit(10)
    
    respond_to do |format|
      format.html
    end    
  end
  
end
