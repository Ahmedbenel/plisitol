class Child < ApplicationRecord
  belongs_to :user
  has_many :children_watchings
  has_many :watchings, through: :children_watchings
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo

  def find_child_watchings(watching)
    self.children_watchings.find_by(watching: watching)
  end
end
