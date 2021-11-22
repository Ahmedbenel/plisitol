class Program < ApplicationRecord
  has_many :reviews
  has_many :users
  has_many :favorites
  has_many :historicals
  validates :title, presence: true
end
