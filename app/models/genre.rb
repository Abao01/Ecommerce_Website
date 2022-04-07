class Genre < ApplicationRecord
  has_many :games

  validates :name, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :games, join_table: 'game_genres'

  def ordered_by_genres
    self.select("genres.*")
        .select("COUNT(genres.id) as genre_count")
        .left_joins(:game_genres)
        .group("genres.id")
        .order("genre_count DESC")
  end
end
