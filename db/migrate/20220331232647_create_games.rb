class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :role
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
