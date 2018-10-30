class CreateTrendingApps < ActiveRecord::Migration[5.2]
  def change
    create_table :trending_apps do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :trending_apps, :title, unique: true
  end
end
