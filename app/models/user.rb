class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :adds, dependent: :destroy
  has_many :songs_added, through: :adds, source: :song
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, :if => :password
end
