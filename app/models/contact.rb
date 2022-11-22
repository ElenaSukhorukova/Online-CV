class Contact < ApplicationRecord
  validates :address, :linkedin, :github, :phone, presence: true
  validates :email, presence: true, format: { with: /([\w\-\.])+@([\w\-\.]+\.)+([a-z]{2,4})/ }
  validates :telegram, presence: true, format: { with: /\A@.*/, message: "Telegram should begin from @" }
  
  belongs_to :user
end
