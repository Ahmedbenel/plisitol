class Program < ApplicationRecord
  CATEGORY = ["documentaire", "comédie", "animation", "educatif", "aventure", "fantastique", "action"]
  LENGTH = ["0-25", "25-50", "50-100", "100-200"]

  belongs_to :platform
  has_many :watchings
  has_many :reviews
  has_many :favorites
  validates :title, presence: true, uniqueness: true
  validates :min_age, numericality: { greater_than_or_equal_to: 1 }
  validates :max_age, numericality: { only_integer: true }
  has_one_attached :photo

  def find_user_favorites(current_user)
    self.favorites.find_by(user: current_user)
  end

  def already_reviewed?(user)
    reviews.select { |review| review.user == user }.any?
  end
end
