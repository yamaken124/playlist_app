class Admin::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
    super
  end

  def create
    super
  end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << [:name, :birth_date, :gender]
        devise_parameter_sanitizer.for(:account_update) << [:name, :birth_date, :bd_open, :gender, :fav_music_genre, :comment]
      end
end
