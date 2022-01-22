class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password_digest, presence: true

  has_many :tweets, dependent: :destroy
end
