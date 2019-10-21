class Song < ApplicationRecord
  belongs_to :user
  has_many :adds, dependent: :destroy
  has_many :users, through: :adds
  validates :title, :artist, presence: true, length: { in: 2..20 } 
end
