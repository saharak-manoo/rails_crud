class Student < ApplicationRecord
  acts_as_paranoid
  validates :name, uniqueness: true, presence: true # อันนี้ก็คือ ไม่ให้ name ซ้ำกัน และห้ามเป็นค่าว่าง หรือ nil
  validates :age, numericality: { less_than_or_equal_to: 100,  only_integer: true }
  validates :gender_id, presence: true

  belongs_to :gender
  has_many :student_courses, dependent: :destroy # has_many ให้เติม s ด้วย ส่วน dependent: :destroy ก็คือถ้า student คนนี้โดนลบ Rails จะลบ student_courses ของคนนี้ให้ด้วย

  def courses
    student_courses.map { |student_course|
      course = student_course&.course
      { code: course&.code, name: course&.name }
    }
  end

  def as_json(options = {})
    if options[:api]
      json = super().except('id')
      json[:gender] = gender&.name # & คือถ้าไม่มีต่อ จะได้ nil ไม่ error
      json[:student_courses] = courses


      json&.with_indifferent_access # with_indifferent_access จะสามารถเรียกได้ สองแบบ ก็คือ json['gender'] หรือ json[:gender]
    else
      super()
    end
  end
end
