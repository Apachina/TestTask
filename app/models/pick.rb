class Pick < ApplicationRecord

  def self.create_picks(all_name, all_url)
    all_name.each_with_index do |name, index|
      Pick.create(title: name, url: all_url[index]) if !Pick.all.map(&:title).include?(name)
    end
  end
end
