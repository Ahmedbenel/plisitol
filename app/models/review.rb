class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)
  belongs_to :watching
  belongs_to :program
  has_one :user, through: :watching
  validates :content, presence: true
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }

  def username
    watching.user.username
  end

end
