class ObservationsController < ApplicationController

  before_action :set_student, only: [:new, :create, :show]
  before_action :set_classroom, only: [:new, :create, :show]

  def index
    @observations = Student.find(params[:id].observations)
  end

  def new
    @observation = @student.observation.new()
  end

  def create
    @observation = @student.observation.new(observation_params)
    if @observation.save
      flash[:success] = "Observation recorded"
      redirect_to classroom_student_path(@student)
    else
      render :new
    end
  end

  def show
    redirect_to classroom_student_path(@student)
  end


private

  def observation_params
    params.require(:observation).permit(:date, :time, :duration, :location, :logged_by, :comments, :student_id, :behavior_id)
  end

  def set_student
    @student = @classroom.students.find(params[:student_id])
  end

  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
  end


end
