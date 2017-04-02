class AddClassroomToStudent < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :classroom, foreign_key: true
  end
end
