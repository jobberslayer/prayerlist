# Hook to add recaptcha to devise user framework
class RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super
    else
      build_resource
      clean_up_passwords(resource)
      flash[:alert] = "There was an error with the recaptcha code below. Please re-enter the code and click submit."
      #render_with_scope :new
      render :new
    end
  end  
end
