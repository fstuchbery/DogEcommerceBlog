class Admin::SessionsController < ApplicationController
  def new
    # This will render the login form
  end

  def create
    @admin = Admin.find_by(username: params[:username])

    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_path
    else
      flash[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path
  end
end
