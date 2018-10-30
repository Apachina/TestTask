class PlasedToSell < ApplicationRecord

  def self.create_plased_to_sell(all_name, all_url)
    all_name.each_with_index do |name, index|
      PlasedToSell.create(title: name, url: all_url[index]) if !PlasedToSell.all.map(&:title).include?(name)
    end
  end
end
