class UnitsController < ApplicationController
  before_action :load_enrollment
  before_action :check_prerequisites

  def complete
    if @unit_enrollment.completed?
      logger.info "Unit is already completed"
      redirect_to next_step
    elsif @unit_enrollment.can_be_completed?
      logger.info "Marking unit as complete"
      @unit_enrollment.complete!
      redirect_to next_step
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

  def next_step
    @unit.next || @lesson.first_question || @lesson
  end

  helper_method def next_label
    case next_step
    when Unit then 'Next Unit'
    when Question then 'Take Quiz'
    when Lesson then 'Complete Lesson'
    end
  end

end
