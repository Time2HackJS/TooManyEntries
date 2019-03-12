class CreateLastentries < ActiveRecord::Migration[5.2]
  def change
    create_table :lastentries do |t|
      t.string :entryid
      t.timestamps
    end
  end
end
