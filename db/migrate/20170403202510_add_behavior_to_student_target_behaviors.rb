class AddBehaviorToStudentTargetBehaviors < ActiveRecord::Migration[5.0]
  def change
    add_reference :student_target_behaviors, :behavior, foreign_key: true
  end
end
