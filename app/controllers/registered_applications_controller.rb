class RegisteredApplicationsController < ApplicationController
  def index
    @registered_apps = RegisteredApplication.all
  end

  def show
    @registered_apps = RegisteredApplication.find(params[:id])
    @events = @registered_apps.event.group_by(&:name)
    p @events
  end

  def new
    @registered_apps = RegisteredApplication.new
  end

  def update
    p params
    @registered_apps = RegisteredApplication.find(params[:id])
    @registered_apps.title = params[:registered_application][:title]
    @registered_apps.url = params[:registered_application][:url]
    @registered_apps.user_id = current_user.id

    if @registered_apps.save
      flash[:notice] = "Registered application was saved."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error saving the registered application. Please try again."
      render :new
    end
  end

  def edit
    @registered_apps = RegisteredApplication.find(params[:id])
  end

  def create
    p params
    @registered_apps = RegisteredApplication.new
    @registered_apps.title = params[:registered_application][:title]
    @registered_apps.url = params[:registered_application][:url]
    @registered_apps.user_id = current_user.id

    if @registered_apps.save
      flash[:notice] = "Registered application was saved."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error saving the registered application. Please try again."
      render :new
    end
  end

  def destroy
    p params
    @registered_apps = RegisteredApplication.find(params[:id])

    if @registered_apps.destroy
     flash[:notice] = "\"#{@registered_apps.title}\" was deleted successfully."
     redirect_to registered_applications_path
    else
     flash.now[:alert] = "There was an error deleting the post."
     render :show
    end

  end


end
