class Admin::AdminController < ApplicationController
  before_action :authorize_admin_user
  layout 'admin'

  def index
  end

  private
  def authorize_admin_user
    user_signed_in? && current_user.admin?
  end
  
end