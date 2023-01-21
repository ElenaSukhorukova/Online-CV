# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact do
  let(:contact) { create(:contact_en) }

  it 'returns contact\'s email' do
    expect(contact.email).to eq('email@email.com')
  end

  describe 'validation' do
    it 'returns true for the address' do
      expect(contact.address.present?).to be true
    end

    it 'returns true for the invalid email' do
      invalid_mail = %w[mailamail.com mail.com@mail mailmailcom].sample
      contact.email = invalid_mail
      expect(contact.invalid?).to be true
    end

    it 'returns true for the invalid telegram' do
      invalid_telegram = %w[https://t.me/test https://google.com/test test@test without_dog].sample
      contact.telegram = invalid_telegram
      expect(contact.invalid?).to be true
    end

    it 'returns false for the invalid phone' do
      contact.phone = Faker::PhoneNumber.subscriber_number(length: 10)
      expect(contact.valid?).to be false
      contact.phone = Faker::PhoneNumber.subscriber_number(length: 12)
      expect(contact.valid?).to be false
    end

    it 'returns true for the invalid linkedin' do
      invalid_linkedin = %w[https:site simple_text https//site.com/test].sample
      contact.linkedin = invalid_linkedin
      expect(contact.invalid?).to be true
    end

    it 'returns false for the invalid github' do
      invalid_github = %w[https:site simple_text https//site.com/test].sample
      contact.github = invalid_github
      expect(contact.valid?).to be false
    end
  end

  describe 'association' do
    it 'belongs a user' do
      expect(contact.user).to be_an_instance_of(User)
    end
  end
end
