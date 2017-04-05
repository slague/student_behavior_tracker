class StudentsController < ApplicationController

  def show
    @behaviors = Behavior.all
    @student = Student.find(params[:id])
    @classroom = Classroom.find(@student)
  end

end
