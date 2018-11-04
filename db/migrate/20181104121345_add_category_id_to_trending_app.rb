class AddCategoryIdToTrendingApp < ActiveRecord::Migration[5.2]
  def change
    add_column :trending_apps, :category_id, :integer
  end
end
