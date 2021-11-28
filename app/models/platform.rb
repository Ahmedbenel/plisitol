class Platform < ApplicationRecord
  has_many :accounts
  has_many :programs
  has_one_attached :photo
end
