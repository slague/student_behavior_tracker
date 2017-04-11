class Student < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :classroom_id, presence: true
  belongs_to :classroom
  has_many :observations
  has_many :behaviors, through: :observations
  has_many :student_target_behaviors

  def target_behaviors
    student_target_behaviors.map { |tb| Behavior.find(tb.behavior_id).keyword }
  end

  def target_behavior_descriptions
    # student_target_behaviors.map { |tb| tb.student_specific_description }
    student_target_behaviors.pluck(:student_specific_description)
  end


  def target_behavior_descriptions_hash
    target_behaviors.zip(target_behavior_descriptions).to_h
  end

end
