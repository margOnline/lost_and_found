class AdminController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin_user!

  def authenticate_admin_user!
    redirect_to root_path unless current_user && current_user.admin?
  end

end