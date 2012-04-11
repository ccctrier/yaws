class Backend::DashboardController < ApplicationController
  protect_from_forgery
  load_and_authorize_resource
  layout "backend/bootstrap"
  
  def index
    authorize! :read, @backend
  end
  
end
