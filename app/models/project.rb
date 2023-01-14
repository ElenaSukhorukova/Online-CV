# frozen_string_literal: true

class Project < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true, length: { within: 3..50 }
  validates :github, presence: true, http_url: true
  validates :site, http_url: true, if: -> { site.present? }

  has_many_attached :previews
  belongs_to :user

  scope :meny_records, -> { where(locale: I18n.locale.to_s).order(created_at: :desc) }
end
