# frozen_string_literal: true

class PersonalDetail < ApplicationRecord
  validates :about, presence: true
  validates :full_name, :position, presence: true, length: { within: 5..50 }

  belongs_to :user
  has_one_attached :photo

  scope :one_record, -> { where(locale: I18n.locale.to_s).last }
end
