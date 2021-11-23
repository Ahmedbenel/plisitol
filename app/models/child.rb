class Child < ApplicationRecord
  belongs_to :user
  has_many :children_watchings
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
