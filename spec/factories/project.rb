# frozen_string_literal: true

FactoryBot.define do
  factory :project_en, class: 'Project' do
    user { User.take || create(:user) }
    title { Faker::Lorem.sentence(word_count: 3) }
    site { 'https://github.com/' }
    github { 'https://github.com/' }
    description do
      Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
    end
    locale { 'en' }

    after(:build) do |project|
      project.previews.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'project_1.png').open,
        filename: 'project_1.png',
        content_type: 'image/png'
      )
      project.previews.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'project_2.jpeg').open,
        filename: 'project_2.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end

  factory :project_ru, class: 'Project' do
    user { User.take || create(:user) }
    title { 'Название проекта' }
    site { 'https://github.com/' }
    github { 'https://github.com/' }
    description { 'Краткое описание проекта. Использованные технологии.' }
    locale { 'ru' }

    after(:build) do |project|
      project.previews.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'project_1.png').open,
        filename: 'project_1.png',
        content_type: 'image/png'
      )
      project.previews.attach(
        io: Rails.root.join('spec', 'factories', 'images', 'project_2.jpeg').open,
        filename: 'project_2.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
