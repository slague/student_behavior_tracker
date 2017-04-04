require 'rails_helper'

describe "Visitor sees a specific student" do
  scenario "a visitor sees a student for a specific classroom" do
    classroom = Classroom.create!(teacher: "Person", room: "Room 1")
    student = classroom.students.create!(name: 'Child')

    visit classroom_student_path(classroom, student)

    expect(page).to have_content("Child")
    # expect(page).to have_content("Target")
    # expect(page).to have_content("70")
  end

end
