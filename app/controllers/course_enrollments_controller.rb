class CourseEnrollmentsController < ApplicationController
  def index
    @enrollments = current_user.enrollments.includes(:course)
  end
end
