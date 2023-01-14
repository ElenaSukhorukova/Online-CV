# frozen_string_literal: true

module Internationalization
  extend ActiveSupport::Concern

  included do
    around_action :swich_locale

    def flash_locale(model)
      return i18n_model_name(model).downcase if I18n.locale.to_s == 'en'

      i18n_model_name(model)
    end

    private

    def swich_locale(&action)
      locale = locale_from_url || locale_from_headers || I18n.default_locale
      response.set_header 'Content-Laguage', locale
      I18n.with_locale locale, &action
    end

    def locale_from_url
      locale = params[:locale]

      return locale if I18n.available_locales.map(&:to_s).include?(locale)
    end

    # Adepted from https://github.com/rack/rack-contrib/blob/main/lib/rack/contrib/locale.rb

    def locale_from_headers
      header = request.env['HTTP_ACCEPT_LANGUAGE']

      return if header.nil?

      locales = header.gsub(/\s+/, '').split(',').map do |language_tag|
        locale, quality = language_tag.split(/;q=/i)
        quality = quality ? quality.to_f : 1.0
        [locale, quality]
      end.reject do |(locale, quality)|
        locale == '*' || quality.zero?
      end.sort_by do |(_, quality)|
        quality
      end.map(&:first)

      return if locales.empty?

      if I18n.enforce_available_locales
        locale = locales.reverse.find { |locale| I18n.available_locales.any? { |al| match?(al, locale) } }
        I18n.available_locales.find { |al| match?(al, locale) } if locale
      else
        locales.last
      end
    end

    def match?(s1, s2)
      s1.to_s.casecmp(s2.to_s).zero?
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end
