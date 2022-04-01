class Game < ApplicationRecord
  belongs_to :publisher
  validates :name, :price, :description, :role, presence: true

  validates :name, uniqueness: true
  validates :price, presence: true

  has_one_attached :image
end
