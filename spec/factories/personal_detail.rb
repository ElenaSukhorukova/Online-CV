# frozen_string_literal: true

FactoryBot.define do
  factory :personal_detail_en, class: 'PersonalDetail' do
    user { User.take || create(:user) }
    full_name { Faker::Name.name }
    position { Faker::Job.position }
    about do
      Faker::Lorem.paragraph(sentence_count: 12, supplemental: true, random_sentences_to_add: 4)
    end
    locale { 'en' }

    after(:build) do |personal_detail|
      personal_detail.photo.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'blank_avatar.png').open,
        filename: 'blank_avatar.png',
        content_type: 'image/png'
      )
    end
  end

  factory :personal_detail_ru, class: 'PersonalDetail' do
    user { User.take || create(:user) }
    full_name { 'Иванова Полина Матвеевна' }
    position { 'Программист' }
    about do
      'Равным образом повышение уровня гражданского сознания обеспечивает' \
        'актуальность всесторонне сбалансированных нововведений. Задача организации,' \
        'в особенности же курс на социально-ориентированный национальный проект' \
        'в значительной степени обуславливает создание дальнейших направлений развитая' \
        'системы массового участия? С другой стороны социально-экономическое развитие в' \
        'значительной степени обуславливает создание модели развития.'
    end
    locale { 'ru' }

    after(:build) do |personal_datum|
      personal_datum.photo.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'blank_avatar.png').open,
        filename: 'blank_avatar.png',
        content_type: 'image/png'
      )
    end
  end
end
