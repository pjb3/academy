require 'test_helper'

class UnitEnrollmentTest < ActiveSupport::TestCase
  test "complete lesson when all units and questions are complete" do
    course_enrollment = course_enrollments(:student_enrollment)
    lesson_enrollment = course_enrollment.start_lesson!(lessons(:lesson_1))

    unit_1 = lesson_enrollment.start_unit!(units(:unit_1))
    unit_1.complete!
    assert unit_1.reload.completed?
    refute lesson_enrollment.reload.completed?
    refute lesson_enrollment.units_completed?

    unit_2 = lesson_enrollment.start_unit!(units(:unit_2))
    unit_2.complete!
    assert unit_2.reload.completed?
    refute lesson_enrollment.reload.completed?
    refute lesson_enrollment.units_completed?

    unit_3 = lesson_enrollment.start_unit!(units(:unit_3))
    unit_3.complete!
    assert unit_3.reload.completed?
    refute lesson_enrollment.reload.completed?
    assert lesson_enrollment.units_completed?

    refute lesson_enrollment.answer(questions(:question_1), choices(:question_1_choice_2))
    refute lesson_enrollment.reload.has_answered?(questions(:question_1))
    assert lesson_enrollment.answer(questions(:question_1), choices(:question_1_choice_1))
    assert lesson_enrollment.reload.has_answered?(questions(:question_1))
    refute lesson_enrollment.reload.completed?

    refute lesson_enrollment.answer(questions(:question_2), choices(:question_2_choice_3))
    refute lesson_enrollment.reload.has_answered?(questions(:question_2))
    assert lesson_enrollment.answer(questions(:question_2), choices(:question_2_choice_1))
    assert lesson_enrollment.reload.has_answered?(questions(:question_2))
    refute lesson_enrollment.reload.completed?

    refute lesson_enrollment.answer(questions(:question_3), choices(:question_3_choice_4))
    refute lesson_enrollment.reload.has_answered?(questions(:question_3))
    assert lesson_enrollment.answer(questions(:question_3), choices(:question_3_choice_1))
    assert lesson_enrollment.reload.has_answered?(questions(:question_3))
    assert lesson_enrollment.reload.units_completed?
    assert lesson_enrollment.reload.quiz_completed?
    assert lesson_enrollment.reload.done?
    lesson_enrollment.complete_if_done!
    assert lesson_enrollment.reload.completed?
  end
end
