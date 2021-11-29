class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :accounts, dependent: :destroy
  has_many :watchings, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :platforms, through: :accounts
  has_many :reviews, through: :watchings
  has_one_attached :photo
end
