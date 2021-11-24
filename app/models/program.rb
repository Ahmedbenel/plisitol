class Program < ApplicationRecord
  CATEGORY = ["documentaire", "comédie", "animation", "educatif", "aventure", "fantastique", "action"]
  AGE = ["0-5", "5-10", "10-15"]
  LENGTH = ["0-25", "25-50", "50-100", "100-200"]

  belongs_to :platform
  has_many :watchings
  has_many :favorites
  validates :title, presence: true, uniqueness: true
  has_one_attached :photo
end
