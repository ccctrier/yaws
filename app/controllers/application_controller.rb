require 'redcarpet'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :login
  end
  
  def mdown2html(txt)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
      :no_intra_emphasis => true, :autolink => true, :space_after_headers => true, :superscript =>true)
    
    markdown.render txt
  end
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def render_404
   respond_to do |format|
     format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
     format.xml  { head :not_found }
     format.any  { head :not_found }
   end
 end

end
