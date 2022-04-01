class Genre < ApplicationRecord
  has_many :game

  validates :name, presence: true
  validates :name, uniqueness: true
  has_and_belongs_to_many :games, join_table: 'game_genres'
end
