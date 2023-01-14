# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :address, presence: true
  validates :email, presence: true, 'valid_email_2/email': { mx: true }
  validates :telegram, presence: true, format: { with: /\A@.*/ }
  validates :phone, presence: true, length: { is: 11 }
  validates :linkedin, :github, http_url: true

  belongs_to :user

  scope :one_record, -> { where(locale: I18n.locale.to_s).last }
end
