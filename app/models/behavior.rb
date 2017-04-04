class Behavior < ActiveRecord::Base
  validates :keyword, presence: true
  has_many :observations
  has_many :students, through: :observations
  has_many :student_target_behaviors
end
