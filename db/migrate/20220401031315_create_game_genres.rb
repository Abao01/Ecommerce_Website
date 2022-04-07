class CreateGameGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :game_genres do |t|
      t.belongs_to :game, null: false
      t.belongs_to :genre, null: false

      t.timestamps
    end
  end
end
