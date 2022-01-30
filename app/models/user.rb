# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  MAXIMUM_NAME_LENGTH = 15
  MAXIMUM_EMAIL_LENGTH = 255
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: MAXIMUM_NAME_LENGTH }
  validates :email, presence: true, length: { maximum: MAXIMUM_EMAIL_LENGTH }, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest, presence: true

  has_many :tweets, dependent: :destroy
end
