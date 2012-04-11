class Backend::DashboardController < ApplicationController
  protect_from_forgery
  layout "backend/bootstrap"
  
  def index
    authorize! :read, @backend
  end
  
end
