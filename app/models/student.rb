class Student < ApplicationRecord
  acts_as_paranoid
  validates :name, uniqueness: true, presence: true # อันนี้ก็คือ ไม่ให้ name ซ้ำกัน และห้ามเป็นค่าว่าง หรือ nil
  validates :age, numericality: { less_than_or_equal_to: 100,  only_integer: true }
end
