FactoryBot.define do
  factory :user do
    email { 'email@email.com' }
    password { "123password" }
    locale { 'en' }
  end
end