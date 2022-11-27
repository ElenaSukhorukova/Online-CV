class PersonalDetail < ApplicationRecord
  validates :about, presence: true
  validates :full_name, presence: true, length: { within: 5..50 }
  validates :position, presence: true, length: { within: 5..50 }

  belongs_to :user
end
