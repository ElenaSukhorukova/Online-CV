# frozen_string_literal: true

module FlashLocale
  extend ActiveSupport::Concern

  included do
    def flash_locale(model)
      return i18n_model_name(model) if model.locale == 'ru'

      i18n_model_name(model).downcase
    end
  end
end
