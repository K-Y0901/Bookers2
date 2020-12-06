class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   protected
  def after_sign_in_path_for(resource)
    user_path(current_user)
    
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  # def authenticate_user
    # if @current_user==nil
      # flash[:notice]="ログインが必要です"
      # redirect_to new_user_session
    # end
  # end
  

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end




end
