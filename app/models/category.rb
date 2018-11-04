class Category < ApplicationRecord
  has_many :trending_apps

  def self.create_category(name)
    Category.create(name: name) unless Category.all.map(&:name).include?(name)
  end
end
