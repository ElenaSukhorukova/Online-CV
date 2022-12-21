# frozen_string_literal: true

class Skill < ApplicationRecord
  validates :skillname, presence: true, length: { within: 3..50 }

  belongs_to :user
end
