class CoursesController < ApplicationController
  def show
    @course_enrollment = current_user.enrollments.find_by!(course_id: params[:id])
    @course = @course_enrollment.course
    @lessons = @course.lessons.order('number')
  end
end
