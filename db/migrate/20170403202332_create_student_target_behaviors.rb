class CreateStudentTargetBehaviors < ActiveRecord::Migration[5.0]
  def change
    create_table :student_target_behaviors do |t|
      t.string :student_specific_description
    end
  end
end
