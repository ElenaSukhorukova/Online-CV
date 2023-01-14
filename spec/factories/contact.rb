FactoryBot.define do

  factory :contact_en, class: Contact do
    user { User.take || create(:user) }
    address { Faker::Address.full_address }
    email { 'email@email.com' }
    linkedin { 'https://www.linkedin.com/' }
    github { 'https://github.com/' }
    phone { Faker::PhoneNumber.subscriber_number(length: 11) }
    telegram { '@telegram' }
    locale { 'en' }
  end

  factory :connect_ru, class: Contact do
    user { User.take || create(:user) }
    address { '147963, Москва, Московская ул., д 3, кв 456' }
    email { 'email@email.com' }
    linkedin { 'https://www.linkedin.com/' }
    github { 'https://github.com/' }
    phone { Faker::PhoneNumber.subscriber_number(length: 11) }
    telegram { '@telegram' }
    locale { 'ru' }
  end
end
