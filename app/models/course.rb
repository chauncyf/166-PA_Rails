class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  self.primary_key = "id"
end
