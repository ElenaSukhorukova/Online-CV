require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project_en) }

  it 'returns a type of experience\'s employer' do
    expect(project.title).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the title'do
      expect(project.title.present?).to be true
    end

    it 'returns true for the description' do
      expect(project.description.present?).to be true
    end

    it 'returns true for the invalid title' do
      project.title = Faker::Alphanumeric.alpha(number: 2)
      expect(project.invalid?).to be true

      project.title = Faker::Alphanumeric.alpha(number: 51)
      expect(project.invalid?).to be true
    end

    it 'returns true for the invalid gitgub' do
      invalid_github = %w[https:site simple_text https//site.com/test].sample
      project.github = invalid_github
      expect(project.invalid?).to be true
    end

    it 'returns true for the invalid site' do
      invalid_site = %w[https:site simple_text https//site.com/test].sample
      project.site = invalid_site
      expect(project.invalid?).to be true
    end

    it 'returns true for the valid site' do
      project.site = nil
      expect(project.valid?).to be true
    end
  end
  
  describe 'association' do
    it 'belongs a user' do
      expect(project.user).to be_an_instance_of(User)
    end

    it { is_expected.to have_many_attached(:previews) }
  end 
end

