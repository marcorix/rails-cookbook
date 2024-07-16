class Recipe < ApplicationRecord
  has_many :bookmarks
  
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
