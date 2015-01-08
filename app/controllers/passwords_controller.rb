class PasswordsController < ApplicationController
  skip_before_action :require_non_temporary_password

  layout 'modal'

  def update
    if current_user.change_password(params[:password], params[:password_confirmation])
      redirect_to root_path, notice: 'You password has been changed'
    else
      render 'new'
    end
  end
end
