class Project < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true, length: { within: 3..50 }
  validates :github, presence: true, 
    format: { 
      with: /(((http(s?):\/\/)+(www\.)?)|(www\.))?+[a-zA-Z0-9\.\-\_]+(\.[a-zA-Z]{2,3})+(\/[a-zA-Z0-9\_\-\s\.\/\?\%\#\&\=]*)?/, 
      message: "should begin from one of www, http://, https:// and has end domain.com/org/ru(or another)" }

  # has_many_attached :previews
  belongs_to :user
end
