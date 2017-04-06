require 'rails_helper'

describe "User can make a new observation" do
  scenario "a visitor logs an observation for a student" do
    classroom = Classroom.create!(teacher: "Adult", room: "Room 1")
    student = classroom.students.create!(name: 'Child')

    date = "04-05-2017"
    time = "11:00 AM"
    duration = "2 minutes"
    location = "Room 1"
    logged_by = "Teacher_2"
    comments = "A short description"

    visit classroom_student_path(classroom, student)
    click_on "New Observation"


    fill_in "observation[date]", with: date
    fill_in "observation[time]", with: time
    fill_in "observation[duration]", with: duration
    fill_in "observation[location]", with: location
    fill_in "observation[logged by]", with: logged_by
    fill_in "observation[comments]", with: comments
    click_button "Record Observation"



    within('.success') do
      expect(page).to have_content("Observation recorded")
    end

    within(#logged behaviors) do
      # expect(page).to have_content(the new observation)
    end
  end

end
