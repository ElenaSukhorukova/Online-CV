# frozen_string_literal: true

class Contact < ApplicationRecord
  regex_site =  Regexp.new('(((http(s?)://)+(www\.)?)|(www\.))?+' \
                           '[a-zA-Z0-9.\-_]+(\.[a-zA-Z]{2,3})+(/[a-zA-Z0-9_\-\s./?%\#&=]*)?')
  validates :address, presence: true
  validates :email, presence: true, 'valid_email_2/email': { mx: true }
  validates :telegram, presence: true, format: { with: /\A@.*/ }
  validates :phone, presence: true, length: { is: 11 }
  validates :linkedin, :github, presence: true,
                                format: {
                                  with: regex_site
                                }

  belongs_to :user

  scope :one_record, -> { where(locale: I18n.locale.to_s).last }
end
