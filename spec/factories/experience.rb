FactoryBot.define do
  factory :experience_en, class: Experience do
    user { User.take || create(:user) }
    employer { Faker::Company.name }
    position { Faker::Job.position }
    date_of_begin { Faker::Date.backward(days: 30) }
    date_of_end { Faker::Date.backward(days: 2) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    locale { 'en' }
  end

  factory :experience_ru, class: Experience do
    user { User.take || create(:user) }
    employer { "Ратодатель" }
    position { "Должность" }
    date_of_begin { Faker::Date.backward(days: 30) }
    date_of_end { Faker::Date.backward(days: 2) }
    description { 
      'Длинное описание рабочих обязанностей. <p>Перечень используемых ' \
      'технологий</p><p>Технология 1</p><p>Технология 2</p><p>Технология 3</p>'
    }
    locale { 'ru' }
  end
end
