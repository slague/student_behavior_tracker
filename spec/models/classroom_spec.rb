require 'rails_helper'

describe Classroom do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a teacher" do
        classroom = Classroom.new(room: "Room 4")
        expect(classroom).to be_invalid
      end
      it "it has a unique teacher" do
        classroom_1 = Classroom.new(teacher: "Ms. Example")
        classroom_1.save
        classroom_2 = Classroom.new(teacher: "Ms. Example")
        expect(classroom_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a teacher's name" do
        classroom = Classroom.new(teacher: "Ms. Example")
        expect(classroom).to be_valid
      end

      it "is valid with a room name and teacher's name" do
        classroom = Classroom.new(teacher: "Ms. Example", room: "Room 2")
        expect(classroom).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many students" do
      classroom = Classroom.new(teacher: "Ms. Example", room: "Room 2")
      expect(classroom).to respond_to(:students)
    end
  end
end
