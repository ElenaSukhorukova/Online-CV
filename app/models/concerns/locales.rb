# frozen_string_literal: true

module Locales
  extend ActiveSupport::Concern

  VALID_LOCALES = %w[en ru].freeze

  included do
    validates :locale, inclusion: { in: VALID_LOCALES }
  end
end
