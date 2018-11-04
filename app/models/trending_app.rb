class TrendingApp < ApplicationRecord
  belongs_to :category

  def self.create_trending_app(title, url, id)
    unless TrendingApp.all.map(&:title).include?(title)
      TrendingApps.create(url: url, title: title, category_id: id)
    end
  end
end
