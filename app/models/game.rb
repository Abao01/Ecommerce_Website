class Game < ApplicationRecord
  belongs_to :publisher

  validates :name, uniqueness: true
  validates :price, presence: true
end
