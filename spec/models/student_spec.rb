require 'rails_helper'

describe Student do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a teacher" do
        student = Student.new()
        expect(student).to be_invalid
      end
      it "has a name" do
        student_1 = Student.new(classroom_id: 1)
        expect(student_1).to be_invalid
      end

      it "has a unique name" do
        student_1 = Student.new(name: "Bob", classroom_id: 1)
        student_1.save
        student_2 = Student.new(name: "Bob", classroom_id: 2)
        expect(student_2).to be_invalid
      end

      it "is assigned to a classroom" do
        classroom = Classroom.new(id: 1, teacher: "Mr. Example", room: "Room 1")
        classroom.save
        student_1 = Student.new(name: "Bob", classroom_id: 1)
        student_2 = Student.new(name: "Sue")
        expect(student_2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        classroom = Classroom.new(id: 1, teacher: "Mr. Example", room: "Room 1")
        classroom.save
        student = Student.new(name: "Bob", classroom_id: 1)
        expect(student).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to classroom" do
      student = Student.new(name: "Bob")
      expect(student).to respond_to(:classroom)
    end
  end
end
