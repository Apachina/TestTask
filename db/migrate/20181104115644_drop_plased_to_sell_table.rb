class DropPlasedToSellTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :plased_to_sells
  end
end
