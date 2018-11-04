class StaticPagesController < ApplicationController

  def show
    @pars = Pars.new

    @names_pick = @pars.staff_picks
    @urls_pick = @pars.urls_staff_picks
    Pick.create_picks(@names_pick, @urls_pick)
    
    @names_categoryes = @pars.all_names_categoryes
    @all_names_picks_in_categoryes = @pars.all_names_picks_in_categoryes
    @all_urls_category = @names_categoryes.map do |name_category|
      @pars.urls_one_category(name_category)
    end

    @names_categoryes.each_with_index do |name_category, index|
      urls_in_one_category = @pars.urls_one_category(name_category)
      Category.create(name: name_category)

      urls_in_one_category.each_with_index do |url, ind|
        id = Category.find_by(name: name_category).id
        TrendingApp.create_trending_app("#{@all_names_picks_in_categoryes[index][ind]}", url, id)
      end
    end
  end
end
