require 'rails_helper'

RSpec.describe Experience, type: :model do
  let(:experience) { create(:experience_en) }

  it 'returns a type of experience\'s employer' do
    expect(experience.employer).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the employer' do
      expect(experience.employer.present?).to be true
    end

    it 'returns true for the position' do
      expect(experience.position.present?).to be true
    end
    
    it 'returns true for the description' do
      expect(experience.description.present?).to be true
    end

    it 'returns true for the date_of_begin' do
      expect(experience.date_of_begin.present?).to be true
    end

    it 'returns false for the valid date_of_end' do
      experience.date_of_end =  nil
      expect(experience.invalid?).to be false  
    end

    it 'returns true for the invalid date_of_begin && date_of_end' do
      experience.date_of_begin =  Faker::Date.backward(days: 2)
      experience.date_of_end =  Faker::Date.backward(days: 30)

      expect(experience.invalid?).to be true

      experience.date_of_begin =  Date.current + 1.day
      expect(experience.invalid?).to be true
    end
  end
  
  describe 'association' do
    it 'belongs a user' do
      expect(experience.user).to be_an_instance_of(User)
    end
  end 
end

