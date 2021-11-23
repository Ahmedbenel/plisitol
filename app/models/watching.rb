class Watching < ApplicationRecord
  belongs_to :program
  belongs_to :user
  has_many :reviews
  has_many :children_watchings
end
