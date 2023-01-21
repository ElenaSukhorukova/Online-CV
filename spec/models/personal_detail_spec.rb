# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonalDetail do
  let(:personal_detail) { create(:personal_detail_en) }

  it 'returns a type of experience\'s employer' do
    expect(personal_detail.full_name).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the about' do
      expect(personal_detail.about.present?).to be true
    end

    it 'returns true for the full name' do
      expect(personal_detail.full_name.present?).to be true
    end

    it 'returns true for the position' do
      expect(personal_detail.position.present?).to be true
    end

    it 'returns true for the invalid full name' do
      personal_detail.full_name = Faker::Alphanumeric.alpha(number: 3)
      expect(personal_detail.invalid?).to be true

      personal_detail.full_name = Faker::Alphanumeric.alpha(number: 51)
      expect(personal_detail.invalid?).to be true
    end

    it 'returns true for the invalid position' do
      personal_detail.position = Faker::Alphanumeric.alpha(number: 3)
      expect(personal_detail.invalid?).to be true

      personal_detail.position = Faker::Alphanumeric.alpha(number: 51)
      expect(personal_detail.invalid?).to be true
    end
  end

  describe 'association' do
    it 'belongs a user' do
      expect(personal_detail.user).to be_an_instance_of(User)
    end

    it { is_expected.to have_one_attached(:photo) }
  end
end
