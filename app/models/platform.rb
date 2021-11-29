class Platform < ApplicationRecord
  PLATFORMS = ["Netflix", "Amazon Prime", "Disney +", "YouTube", "Salto", "OCS", "Canal +"]

  has_many :accounts
  has_many :programs
  has_one_attached :photo
end
