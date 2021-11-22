class Review < ApplicationRecord
  belongs_to :user
  belongs_to :program
  validates :rating, presence: true
end
