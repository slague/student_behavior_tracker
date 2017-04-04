class Classroom < ActiveRecord::Base
  validates :teacher, presence: true, uniqueness: true
  has_many :students
end
