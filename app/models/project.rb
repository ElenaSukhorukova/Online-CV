class Project < ApplicationRecord
  validates :github, :description, presence: true
  validates :title, presence: true, length: { within: 3..50 }

  has_many_attached :previews
  belongs_to :user
end
