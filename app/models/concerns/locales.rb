module Locales
  extend ActiveSupport::Concern

  VALID_LOCALES = ['en', 'ru']

  included do 
    validates :locale, inclusion: { in: VALID_LOCALES }
  end
end
