class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top,:about]

def after_sign_in_path_for(resorce)
  user_path(current_user)
end
def after_sign_out_path_for(resorce)
  root_path
end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :postcode, :prefecture_name, :address_city, :address_street, :address_building])
  end
end
