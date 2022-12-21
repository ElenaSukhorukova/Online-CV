class Contact < ApplicationRecord
  validates :address, presence: true
  validates :email, presence: true, 'valid_email_2/email': { mx: true }
  validates :telegram, presence: true, format: { with: /\A@.*/, message: 'Telegram should begin from @' }
  validates :phone, presence: true,
                    format: {
                      with: /(\d|\+\d)+\d{10}/,
                      message: 'A phone number should be 11 numbers'
                    }
  validates :linkedin, :github, presence: true,
                                format: {
                                  with: %r{(((http(s?)://)+(www\.)?)|(www\.))?+[a-zA-Z0-9.\-_]+(\.[a-zA-Z]{2,3})+(/[a-zA-Z0-9_\-\s./?%\#&=]*)?},
                                  message: 'should begin from one of www, http://, https:// and has end domain.com/org/ru(or another)'
                                }

  belongs_to :user
end
