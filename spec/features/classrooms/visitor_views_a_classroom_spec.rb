require "rails_helper"

describe "visitor views a classrom" do
  scenario "a visitor views the classrooms with a list of all its students" do
    classroom = Classroom.create!(teacher: "Person", room: "Room 1")
    classroom.students.create!(name: "StudentA")
    classroom.students.create!(name: "StudentB")
    classroom.students.create!(name: "StudentC")

    visit classroom_path(classroom)

    expect(current_path).to eq("/classrooms/#{classroom.id}")
    expect(page).to have_content("Person")
    expect(page).to have_content("StudentA")
    expect(page).to have_content("StudentB")
    expect(page).to have_content("StudentC")
    expect(page).to have_link("StudentA")
    expect(page).to have_link("StudentB")
    expect(page).to have_link("StudentC")
  end
end
