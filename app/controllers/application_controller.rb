class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    case resource
    when User
      playlists_path
    when Admin
      admin_playlists_path
    end
  end
end
