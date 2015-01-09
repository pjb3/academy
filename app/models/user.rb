class User < ActiveRecord::Base

  has_many :enrollments, class_name: 'CourseEnrollment'

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  def change_password(password, password_confirmation)
    update(password: password, password_confirmation: password_confirmation, temporary_password: false)
  end

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
