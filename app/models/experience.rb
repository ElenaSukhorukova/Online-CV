class Experience < ApplicationRecord
  validates :employer, :position, :description, presence: true
  validates :date_of_begin, presence: true, comparison: { less_than: Date.current, 
      message: 'The begin of your experience shouldn\'t be later than current date'
    }

  validates :date_of_begin, format: { with: /\d{4}\-\d{2}\-\d{2}/,
      message: "A format of date is not right" 
    }

  validates :date_of_end, allow_blank: true, format: { with: /\d{4}\-\d{2}\-\d{2}/,
      message: "A format of date is not right" 
    }
  validate :check_date

  def check_date
    if date_of_begin.year > date_of_end.year
      errors.add(:date_of_end, 'a year of date of the end should be less than year of date of the beging')
    end
  end

  belongs_to :user
end
