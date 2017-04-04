require "rails_helper"

describe "User sees all classrooms" do
  scenario "a user sees all the classrooms" do
    classroom = Classroom.create!(teacher: "Person", room: "Room 1")
    classroom_2 = Classroom.create!(teacher: "Someone", room: "Room 2")

    visit classrooms_path

    expect(page).to have_content("Person")
    expect(page).to have_content("Someone")
    expect(page).to have_content("Room 1")
    expect(page).to have_content("Room 2")
  end
end
