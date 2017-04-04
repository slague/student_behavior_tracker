class AddStudentToStudentTargetBehaviors < ActiveRecord::Migration[5.0]
  def change
    add_reference :student_target_behaviors, :student, foreign_key: true
  end
end
