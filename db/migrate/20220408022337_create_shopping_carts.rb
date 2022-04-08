class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
