class Contact < ApplicationRecord
  validates :address, :phone, presence: true
  validates :email, presence: true, format: { with: /([\w\-\.])+@([\w\-\.]+\.)+([a-z]{2,4})/ }
  validates :telegram, presence: true, format: { with: /\A@.*/, message: "Telegram should begin from @" }
  validates :linkedin, :github, presence: true, 
    format: { 
      with: /(((http(s?):\/\/)+(www\.)?)|(www\.))?+[a-zA-Z0-9\.\-\_]+(\.[a-zA-Z]{2,3})+(\/[a-zA-Z0-9\_\-\s\.\/\?\%\#\&\=]*)?/, 
      message: "should begin from one of www, http://, https:// and has end domain.com/org/ru(or another)" }

  belongs_to :user
end
