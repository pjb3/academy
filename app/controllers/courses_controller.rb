class CoursesController < ApplicationController
  def show
    @course_enrollment = current_user.enrollments.find_by!(course_id: params[:id])
    @course = @course_enrollment.course
    @course_enrollment.start!
    @lessons = @course.lessons.order('number')
  end
end
