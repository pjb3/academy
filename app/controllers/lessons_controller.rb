class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @course_enrollment = current_user.enrollments.find_by!(course: @lesson.course)
    @course = @course_enrollment.course
    @lesson_enrollment = @course_enrollment.start_lesson!(@lesson)
    @units = @lesson.units.order('number')
  end
end
