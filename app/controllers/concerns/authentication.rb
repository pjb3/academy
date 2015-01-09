module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?
    helper_method :current_user

    before_action :require_log_in
    before_action :require_non_temporary_password
  end

  def require_log_in
    redirect_to log_in_path, alert: 'Please Log In' unless logged_in?
  end

  def require_non_temporary_password
    redirect_to change_password_path, alert: 'You are using a temporary password, please change it now' if current_user.try(:temporary_password?)
  end

  def current_user_id
    cookies.signed[:user_id]
  end

  def logged_in?
    current_user_id.present?
  end

  def current_user
    @current_user ||= User.find(current_user_id) if logged_in?
  end

  def log_in!(user)
    user.update(last_logged_in_at: Time.current)
    cookies.signed.permanent[:user_id] = {
      value: user.id
    }
    user
  end

  def log_out!
    cookies.delete(:user_id)
  end

end
