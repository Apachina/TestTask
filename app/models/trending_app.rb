class TrendingApp < ApplicationRecord

  def self.create_trending_app(all_name, all_url)
    all_name.each_with_index do |name, index|
      TrendingApp.create(title: name, url: all_url[index]) if !TrendingApp.all.map(&:title).include?(name)
    end
  end
end
