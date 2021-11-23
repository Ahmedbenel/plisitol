class Platform < ApplicationRecord
  has_many :accounts
  has_many :programs
end
