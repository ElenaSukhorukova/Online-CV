# frozen_string_literal: true

class Project < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true, length: { within: 3..50 }
  validates :github, presence: true,
                     format: {
                       with: %r{(((http(s?)://)+(www\.)?)|(www\.))?+
                               [a-zA-Z0-9.\-_]+(\.[a-zA-Z]{2,3})+
                               (/[a-zA-Z0-9_\-\s./?%\#&=]*)?}
                     }

  # has_many_attached :previews
  belongs_to :user

  scope :meny_records, -> { where(locale: I18n.locale.to_s).order(created_at: :desc) }
end
