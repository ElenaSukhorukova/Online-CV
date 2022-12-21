# frozen_string_literal: true

class Education < ApplicationRecord
  validates :name_organization, :degree, :field_of_study, presence: true
  validates :date_of_end, presence: true,
                          format: { with: /\d{4}-\d{2}-\d{2}/ },
                          comparison: { less_than: Date.current }

  belongs_to :user

  scope :meny_records, -> { where(locale: I18n.locale.to_s).order(date_of_end: :desc) }
end
