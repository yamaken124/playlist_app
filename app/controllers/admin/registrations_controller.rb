class Admin::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end

  def after_sign_up_path_for(admin)
    admin_playlists_path
  end

  def after_inactive_sign_up_path_for(admin)
    admin_playlists_path
  end

  def after_update_path_for(admin)
    admin_playlists_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
     protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << [:name, :birth_date, :gender]
        devise_parameter_sanitizer.for(:account_update) << [:name, :birth_date, :bd_open, :gender, :fav_music_genre, :comment]
      end
end
