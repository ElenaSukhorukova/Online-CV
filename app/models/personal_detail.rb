# frozen_string_literal: true

class PersonalDetail < ApplicationRecord
  validates :about, presence: true
  validates :full_name, presence: true, length: { within: 5..50 }
  validates :position, presence: true, length: { within: 5..50 }

  belongs_to :user

  scope :one_record, -> { where(locale: I18n.locale.to_s).last }
end
