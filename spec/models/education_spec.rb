require 'rails_helper'

RSpec.describe Education, type: :model do
  let(:education) { create(:education_en) }

  it 'returns a type of experience\'s name of the organization' do
    expect(education.name_organization).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the name of the organization' do
      expect(education.name_organization.present?).to be true
    end

    it 'returns true for the degree'do
      expect(education.degree.present?).to be true
    end
    
    it 'returns true for the field of the study' do
      expect(education.field_of_study.present?).to be true
    end

    it 'returns true for the date_of_begin' do
      expect(education.date_of_end.present?).to be true
    end

    it 'returns false for the invalid date_of_end' do
      education.date_of_end =  Date.current + 1.day
      expect(education.valid?).to be false  
    end
  end

  describe 'association' do
    it 'belongs a user' do
      expect(education.user).to be_an_instance_of(User)
    end
  end
end