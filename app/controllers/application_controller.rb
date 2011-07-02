class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private

  # setting  language

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  # change default devise redirection

  def after_sign_in_path_for(resource)
    hub_user_path resource
  end

  # basic identity protections

  def is_admin?
    current_user.is_admin == true || current_user.email == "bartlomiej.rycharski@gmail.com"
  end

  def is_user?
    is_admin? || @user == current_user
  end

  def is_owner?(object)
    object.user == current_user
  end

  def verify_admin
    unless is_admin?
      flash[:alert]= "Access denied"
      redirect_to root_url
    end
  end

  def verify_user
    unless is_user?
      flash[:alert]= "Access denied"
      redirect_to root_url
    end
  end

  def verify_teacher
    unless @user.is_teacher
      flash[:alert]= "This user is not a teacher."
      redirect_to root_url
    end
  end

  def find_teachers
    @teachers = User.teachers
  end

end
