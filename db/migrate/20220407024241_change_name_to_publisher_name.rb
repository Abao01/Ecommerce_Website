class ChangeNameToPublisherName < ActiveRecord::Migration[7.0]
  def change
    rename_column :publishers, :name, :publisher_name
  end
end
