# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'association', :last do
    it { is_expected.to have_many :contacts }
    it { is_expected.to have_many :courses }
    it { is_expected.to have_many :educations }
    it { is_expected.to have_many :experiences }
    it { is_expected.to have_many :personal_details }
    it { is_expected.to have_many :projects }
    it { is_expected.to have_many :skills }
  end
end
