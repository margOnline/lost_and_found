class Admin::AdminController < ApplicationController
  authenticate_user!
  before_action :authorize_admin_user
  layout 'admin'

  def index
  end

  private
  def authorize_admin_user
    return unless user_signed_in? && current_user.admin?
  end
  
end