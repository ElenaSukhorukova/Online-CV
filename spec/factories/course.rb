# frozen_string_literal: true

FactoryBot.define do
  factory :course_en, class: 'Course' do
    user { User.take || create(:user) }
    coursename { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    date_of_end { Faker::Date.backward(days: 14) }
    locale { 'en' }
  end

  factory :course_ru, class: 'Course' do
    user { User.take || create(:user) }
    coursename { "Курс № #{index + 1}" }
    description { 'Не длинное описание курса. Какие технологии были изучены.' }
    date_of_end { Faker::Date.backward(days: 14) }
    locale { 'ru' }
  end
end
