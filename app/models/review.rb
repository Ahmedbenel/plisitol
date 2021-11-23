class Review < ApplicationRecord
  belongs_to :watching
  validates :content, presence: true
  validates :rating, numericality: { in: 0..5 }
end
