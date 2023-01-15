require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { create(:skill_en) }

  it 'returns a type of skill\'s name' do
    expect(skill.description).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the skillname'do
      expect(skill.skillname.present?).to be true
    end

    it 'returns true for the invalid skillname' do
      skill.skillname = Faker::Alphanumeric.alpha(number: 2)
      expect(skill.invalid?).to be true

      skill.skillname = Faker::Alphanumeric.alpha(number: 51)
      expect(skill.invalid?).to be true
    end
  end
  
  describe 'association' do
    it 'belongs a user' do
      expect(skill.user).to be_an_instance_of(User)
    end
  end 
end
