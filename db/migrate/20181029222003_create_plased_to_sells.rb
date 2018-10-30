class CreatePlasedToSells < ActiveRecord::Migration[5.2]
  def change
    create_table :plased_to_sells do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :plased_to_sells, :title, unique: true
  end
end
