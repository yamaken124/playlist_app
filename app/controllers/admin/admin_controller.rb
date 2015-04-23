class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"
  def after_sign_in_path_for(resource)
    admin_playlists_path
  end

end
