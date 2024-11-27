class Admin::DashboardController < ApplicationController
  before_action :require_admin_login

  def index
    # Dashboard content
  end

  private

  def require_admin_login
    redirect_to login_path unless session[:admin_id]
  end
end
