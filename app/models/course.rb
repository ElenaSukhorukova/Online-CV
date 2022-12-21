class Course < ApplicationRecord
  validates :coursename, :description, presence: true
  validates :date_of_end, presence: true,
                          format: { with: /\d{4}-\d{2}-\d{2}/,
                                    message: 'A format of date is not right' },
                          comparison: { less_than: Date.current,
                                        message: 'The begin of your experience shouldn\'t be later than current date' }

  belongs_to :user
end
