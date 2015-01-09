class LessonsController < ApplicationController
  before_action :load_enrollment
  before_action :check_prerequisites

private
  def load_enrollment
    @lesson = Lesson.find(params[:id])
    @course_enrollment = current_user.enrollments.find_by!(course: @lesson.course)
    @course = @course_enrollment.course
    @lesson_enrollment = @course_enrollment.start_lesson!(@lesson)
    @units = @lesson.units.order('number')
  end

  def check_prerequisites
    unless @lesson.first? || @course_enrollment.has_completed?(@lesson.prev)
      redirect_to course_path(@course), alert: 'You must complete the previous lessons before you can access this lesson'
    end
  end
end
