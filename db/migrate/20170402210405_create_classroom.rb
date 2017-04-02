class CreateClassroom < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :teacher
      t.string :room
    end
  end
end
