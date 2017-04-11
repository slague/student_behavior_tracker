class Observation < ActiveRecord::Base
  belongs_to :student
  belongs_to :behavior

  validates :behavior_id, :student_id, :date, :comments, presence: true
end



# :date, :time, :duration, :location, :logged_by, :comments, :student_id, :behavior_id
