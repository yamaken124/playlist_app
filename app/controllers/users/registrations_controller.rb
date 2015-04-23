class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def new
    super
  end

  def create
    # deliverメソッドを使って、メールを送信する
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
        SignUpMailer.sign_up_email(@user).deliver
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
        SignUpMailer.sign_up_email(@user).deliver
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def after_sign_up_path_for(user)
    playlists_path
  end

  def after_inactive_sign_up_path_for(user)
    playlists_path
  end

  def after_update_path_for(user)
    playlists_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :birth_date, :gender]
      devise_parameter_sanitizer.for(:account_update) << [:name, :birth_date, :bd_open, :gender, :fav_music_genre, :comment, :image]
    end

end
