class Game < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :genres, join_table: 'game_genres'
  validates :name, :price, :description, :role, presence: true

  validates :name, uniqueness: true
  validates :price, presence: true

  has_one_attached :image
end
