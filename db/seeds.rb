# frozen_string_literal: true

unless User.first
  email = 'email@email.com'
  password = 'test123'

  User.create email: email, password: password
end

unless Contact.where(locale: 'en').any?
  address = Faker::Address.full_address
  email = 'email@email.com'
  phone = '22057302142'
  linkedin = 'https://www.linkedin.com/'
  github = 'https://github.com/'
  telegram = '@telegram'
  locale = 'en'
  user_id = User.last.id

  Contact.create address: address, email: email, phone: phone, linkedin: linkedin,
                 github: github, telegram: telegram, locale: locale, user_id: user_id
end

unless Contact.where(locale: 'ru').any?
  address = '147963, Москва, Московская ул., д 3, кв 456'
  email = 'email@email.com'
  phone = '22057302142'
  linkedin = 'https://www.linkedin.com/'
  github = 'https://github.com/'
  telegram = '@telegram'
  locale = 'ru'
  user_id = User.last.id

  Contact.create address: address, email: email, phone: phone, linkedin: linkedin,
                 github: github, telegram: telegram, locale: locale, user_id: user_id
end

unless PersonalDetail.where(locale: 'en').any?
  full_name = Faker::Name.name
  position = Faker::Job.position
  about = Faker::Lorem.paragraph(sentence_count: 12, supplemental: true, random_sentences_to_add: 4)
  locale = 'en'
  user_id = User.last.id

  PersonalDetail.create full_name: full_name, position: position,
                        about: about, locale: locale, user_id: user_id
end

unless PersonalDetail.where(locale: 'ru').any?
  full_name = 'Иванова Полина Матвеевна'
  position = 'программист'
  about = 'Равным образом повышение уровня гражданского сознания обеспечивает' \
          'актуальность всесторонне сбалансированных нововведений. Задача организации,' \
          'в особенности же курс на социально-ориентированный национальный проект' \
          'в значительной степени обуславливает создание дальнейших направлений развитая' \
          'системы массового участия? С другой стороны социально-экономическое развитие в' \
          'значительной степени обуславливает создание модели развития.'
  locale = 'ru'
  user_id = User.last.id

  PersonalDetail.create full_name: full_name, position: position,
                        about: about, locale: locale, user_id: user_id
end

(8 - Skill.where(locale: 'en').count).times do
  skill = Faker::Job.key_skill
  description = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 4)
  user_id = User.last.id
  locale = 'en'

  Skill.create skillname: skill, description: description, user_id: user_id, locale: locale
end

(8 - Skill.where(locale: 'ru').count).times do |index|
  skill = "Навык #{index}"
  description = 'Не длинное описание навыка. Где получен. Какой уровень'
  user_id = User.last.id
  locale = 'ru'

  Skill.create skillname: skill, description: description, user_id: user_id, locale: locale
end

(5 - Course.where(locale: 'en').count).times do
  coursename = Faker::Lorem.sentence(word_count: 3)
  description = Faker::Lorem.paragraph(sentence_count: 2)
  date_of_end = Faker::Date.backward(days: 14)
  locale = 'en'
  user_id = User.last.id

  Course.create coursename: coursename, description: description,
                date_of_end: date_of_end, locale: locale, user_id: user_id
end

(5 - Course.where(locale: 'ru').count).times do |index|
  coursename = "Курс № #{index}"
  description = 'Не длинное описание курса. Какие технологии были изучены.'
  date_of_end = Faker::Date.backward(days: 14)
  locale = 'ru'
  user_id = User.last.id

  Course.create coursename: coursename, description: description,
                date_of_end: date_of_end, locale: locale, user_id: user_id
end

(2 - Education.where(locale: 'en').count).times do
  name_organization = Faker::Educator.university
  degree = Faker::Educator.degree
  field_of_study = Faker::Educator.subject
  date_of_end = Faker::Date.backward(days: 5)
  locale = 'en'
  user_id = User.last.id

  Education.create name_organization: name_organization, degree: degree,
                   field_of_study: field_of_study, date_of_end: date_of_end,
                   locale: locale, user_id: user_id
end

(2 - Education.where(locale: 'ru').count).times do |index|
  name_organization = "Учебное заведение #{index}"
  degree = "Степень #{index}"
  field_of_study = "Сфера обучения #{index}"
  date_of_end = Faker::Date.backward(days: 5)
  locale = 'ru'
  user_id = User.last.id

  Education.create name_organization: name_organization, degree: degree,
                   field_of_study: field_of_study, date_of_end: date_of_end,
                   locale: locale, user_id: user_id
end

(4 - Experience.where(locale: 'en').count).times do
  employer = Faker::Company.name
  position = Faker::Job.position
  date_of_begin = Faker::Date.backward(days: 30)
  date_of_end = Faker::Date.backward(days: 2)
  description = Faker::Lorem.sentence(word_count: 3)
  locale = 'en'
  user_id = User.last.id

  Experience.create employer: employer, position: position, description: description,
                    date_of_begin: date_of_begin, date_of_end: date_of_end,
                    locale: locale, user_id: user_id
end

(4 - Experience.where(locale: 'ru').count).times do |index|
  employer = "Ратодатель #{index}"
  position = "Должность #{index}"
  date_of_begin = Faker::Date.backward(days: 30)
  date_of_end = Faker::Date.backward(days: 2)
  description = 'Длинное описание рабочих обязанностей. <p>Перечень используемых ' \
                'технологий</p><p>Технология 1</p><p>Технология 2</p><p>Технология 3</p>'
  locale = 'ru'
  user_id = User.last.id

  Experience.create employer: employer, position: position, description: description,
                    date_of_begin: date_of_begin, date_of_end: date_of_end,
                    locale: locale, user_id: user_id
end

(7 - Project.where(locale: 'en').count).times do
  title = Faker::Lorem.sentence(word_count: 3)
  site = 'https://github.com/'
  github = 'https://github.com/'
  description = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  locale = 'en'
  user_id = User.last.id

  Project.create title: title, site: site, github: github, description:
                  description, locale: locale, user_id: user_id
end

(7 - Project.where(locale: 'ru').count).times do |index|
  title = "Название проекта #{index}"
  site = 'https://github.com/'
  github = 'https://github.com/'
  description = 'Краткое описание проекта. Использованные технологии. '
  locale = 'ru'
  user_id = User.last.id

  Project.create title: title, site: site, github: github, description:
                  description, locale: locale, user_id: user_id
end
