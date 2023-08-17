class Movie < ApplicationRecord
  has_many :lists, through: :bookmarks
  has_many :bookmarks

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
end
