class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, :course_id, presence: true
  validates :course_id, uniqueness: { scope: :student_id } # ก็คือ ห้ามมีวิชาเดียวกัน โดยดูจาก student_id
end
