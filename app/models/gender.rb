class Gender < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_one :student
end
