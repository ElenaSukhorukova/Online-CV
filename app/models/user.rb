# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { admin: 0 }, _suffix: :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :personal_details, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :skills, dependent: :destroy
end
