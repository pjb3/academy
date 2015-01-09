class UnitsController < ApplicationController
  before_action :load_enrollment
  before_action :check_prerequisites

  def complete
    if @unit_enrollment.completed?
      redirect_to next_url
    elsif @unit_enrollment.can_be_completed?
      @unit_enrollment.complete!
      redirect_to next_url
    else
      head :forbidden
    end
  end

private
  def load_enrollment
    @unit = Unit.find(params[:id])
    @lesson = @unit.lesson
    @course = @lesson.course
    @course_enrollment = current_user.enrollments.find_by!(course: @course)
    @lesson_enrollment = @course_enrollment.lesson_enrollments.find_by!(lesson: @lesson)
    @unit_enrollment = @lesson_enrollment.start_unit!(@unit)
  end

  def check_prerequisites
    unless @unit.first? || @lesson_enrollment.has_completed?(@unit.prev)
      redirect_to lesson_path(@lesson), alert: 'You must complete the previous units before you can access this unit'
    end
  end

  def next_url
    if @unit.next
      unit_url(@unit.next)
    else
      lesson_url(@lesson)
    end
  end

end
