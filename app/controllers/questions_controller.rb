class QuestionsController < ApplicationController
  before_action :load_enrollment
  before_action :check_prerequisites

  def show
    if @lesson_enrollment.has_answered?(@question)
      @choice = @question.correct_choice
    end
  end

  def update
    if @lesson_enrollment.has_answered?(@question)
      logger.info "Question was already answered"
      redirect_to @question.next || @question.lesson
    else
      @choice = Choice.find(params[:choice_id])
      if @lesson_enrollment.answer(@question, @choice)
        logger.info "Choice was correct"
        if @question.next
          logger.info "Redirecting to next question"
          redirect_to @question.next, notice: "That's correct, Great job!"
        else
          logger.info "End of quiz, redirecting to lesson"
          redirect_to @question.lesson, notice: "Correct, you've completed the lesson! Great job!"
        end
      else
        logger.info "Choice was not correct"
        render 'show'
      end
    end
  end

  private
  def load_enrollment
    @question = Question.find(params[:id])
    @lesson = @question.lesson
    @course_enrollment = current_user.enrollments.find_by!(course: @lesson.course)
    @course = @course_enrollment.course
    @lesson_enrollment = @course_enrollment.start_lesson!(@lesson)
    @choices = @question.choices.shuffle
  end

  def check_prerequisites
    unless @lesson_enrollment.units_completed?
      redirect_to lesson_path(@lesson), alert: 'You must complete the lesson before you take the quiz'
    end
  end

end
