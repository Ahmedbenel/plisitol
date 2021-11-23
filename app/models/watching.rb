class Watching < ApplicationRecord
  belongs_to :program
  belongs_to :user
end
