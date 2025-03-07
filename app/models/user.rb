class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, inclusion: { in: %w[admin seller customer], message: "%{value} is not a valid role" } # Example roles
end
