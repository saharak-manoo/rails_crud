class Course < ApplicationRecord
  validates :code, :name, uniqueness: true, presence: true

  has_many :student_courses, dependent: :destroy
end
