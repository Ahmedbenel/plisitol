class Child < ApplicationRecord
  belongs_to :user
  has_many :children_watchings
  has_many :watchings, through: :children_watchings
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo

  def find_child_watchings(watching)
    self.children_watchings.find_by(watching: watching)
  end

  def calculate_watching_by_date(date)
    self.children_watchings.where(created_at: date).map { |cw| cw.watching.program.length }.sum
  end

  def calculate_watching_by_category(category)
    lengths = []
    self.children_watchings.each do |cw|
      if cw.watching.program.category == category
        lengths << cw.watching.program.length
      end
    end
    lengths.reduce(&:+)
  end

  def calculate_cw_all_categories
    categories = {}
    Program::CATEGORY.each do |category|
      categories[category] = self.calculate_watching_by_category(category)
    end
    categories
  end
end
