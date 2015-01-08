class User < ActiveRecord::Base
  has_secure_password

  def change_password(password, password_confirmation)
    update(password: password, password_confirmation: password_confirmation, temporary_password: false)
  end
end
