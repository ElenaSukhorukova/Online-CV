# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course do
  let(:course) { create(:course_en) }

  it 'returns a type of course\'s coursename' do
    expect(course.coursename).to be_an_instance_of(String)
  end

  describe 'validation' do
    it 'returns true for the coursename' do
      expect(course.coursename.present?).to be true
    end

    it 'returns true for the coursename' do
      expect(course.description.present?).to be true
    end

    it 'returns true for the invalid date of the end' do
      course.date_of_end = Date.current + 1.year
      expect(course.invalid?).to be true

      course.date_of_end = 'invalid date'
      expect(course.invalid?).to be true
    end
  end

  describe 'association' do
    it 'belongs a user' do
      expect(course.user).to be_an_instance_of(User)
    end
  end
end
