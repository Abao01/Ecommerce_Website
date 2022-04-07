class ChangeNameToGameName < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :name, :game_name
  end
end
