class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :genre
      t.string :date
      t.string :synopsis
      t.string :tags
      t.string :poster
      t.timestamps
    end
  end
end
