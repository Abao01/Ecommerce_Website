class Publisher < ApplicationRecord
  has_many :games

  validates :publisher_name, uniqueness: true
  validates :publisher_name, presence: true

  def self.ordered_by_games
    self.select("publishers.*")
        .select("COUNT(publishers.id) as game_count")
        .left_joins(:games)
        .group("publishers.id")
        .order("game_count DESC")
  end
end
