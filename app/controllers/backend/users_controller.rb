class Backend::UsersController < ApplicationController
  protect_from_forgery
  layout "backend/bootstrap"

  def index
    @users = User.all

    authorize! :manage, @users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to backend_users_path, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to backend_users_url, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @User = User.find(params[:id])
    @User.destroy

    respond_to do |format|
      format.html { redirect_tobackend_ users_url }
      format.json { head :no_content }
    end
  end

end
