# frozen_string_literal: true

class Experience < ApplicationRecord
  validates :employer, :position, :description, presence: true
  validates :date_of_begin, presence: true, comparison: { less_than: Date.current }

  validates :date_of_begin, format: { with: /\d{4}-\d{2}-\d{2}/ }

  validates :date_of_end, allow_blank: true, format: { with: /\d{4}-\d{2}-\d{2}/ }
  validate :check_date

  def check_date
    return unless date_of_begin.year > date_of_end.year

    errors.add(:date_of_end, t('activerecord.errors.models.experiences.attributes.date_of_end.wrong_date'))
  end

  belongs_to :user

  scope :meny_records, -> { where(locale: I18n.locale.to_s).order(date_of_begin: :desc) }
end
