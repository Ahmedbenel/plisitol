class Program < ApplicationRecord
  belongs_to :platform
  has_many :watchings
  has_many :favorites
  validates :title, presence: true, uniqueness: true
  has_one_attached :photo
end
