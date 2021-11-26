class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts
  has_many :watchings
  has_many :children
  has_many :favorites
  has_many :platforms, through: :accounts
  has_many :reviews, through: :watchings
  has_one_attached :photo
end
