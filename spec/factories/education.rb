# frozen_string_literal: true

FactoryBot.define do
  factory :education_en, class: 'Education' do
    user { User.take || create(:user) }
    name_organization { Faker::Educator.university }
    degree { Faker::Educator.degree }
    field_of_study { Faker::Educator.subject }
    date_of_end { Faker::Date.backward(days: 5) }
    locale { 'en' }
  end

  factory :education_ru, class: 'Education' do
    user { User.take || create(:user) }
    name_organization { 'Учебное заведение' }
    degree { 'Степень' }
    field_of_study { 'Сфера обучения' }
    date_of_end { Faker::Date.backward(days: 5) }
    locale { 'ru' }
  end
end
