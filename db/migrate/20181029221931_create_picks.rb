class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :picks, :title, unique: true
  end
end
