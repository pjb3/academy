class UnitsController < ApplicationController
  def show
    @unit = Unit.find(params[:id])
    @lesson = @unit.lesson
    @course = @lesson.course
    @course_enrollment = current_user.enrollments.find_by!(course: @course)
    @lesson_enrollment = @course_enrollment.lesson_enrollments.find_by!(lesson: @lesson)
    @unit_enrollment = @lesson_enrollment.start_unit!(@unit)
  end
end
