class Backend::DashboardController < ApplicationController
  layout "backend/bootstrap"
  
  def index
    authorize! :read, @backend
  end
  
end
