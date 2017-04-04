class Student < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :classroom_id, presence: true
  belongs_to :classroom
  has_many :observations
  has_many :behaviors, through: :observations
  has_many :student_target_behaviors
end
