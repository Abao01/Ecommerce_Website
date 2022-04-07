class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :role
      t.belongs_to :publisher, null: false

      t.timestamps
    end
  end
end
