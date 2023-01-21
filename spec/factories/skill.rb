# frozen_string_literal: true

FactoryBot.define do
  factory :skill_en, class: 'Skill' do
    user { User.take || create(:user) }
    skillname { Faker::Job.key_skill }
    description { Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 4) }
    locale { 'en' }
  end

  factory :skill_ru, class: 'Skill' do
    user { User.take || create(:user) }
    skillname { 'Навык' }
    description { 'Не длинное описание навыка. Где получен. Какой уровень' }
    locale { 'ru' }
  end
end
