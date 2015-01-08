class LogInController < ApplicationController
  skip_before_action :require_log_in
  skip_before_action :require_non_temporary_password

  layout 'modal'

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      log_in!(user)
      redirect_to root_path
    else
      flash.now[:error] = 'Log In Failed'
      render 'new'
    end
  end
end
