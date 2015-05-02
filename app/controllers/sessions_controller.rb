class SessionsController < Devise::SessionsController
  def after_sign_in_path
    return items_url
  end
end