class StaticPagesController < ApplicationController

  def show
    @pars = Pars.new

    @names_pick = @pars.staff_picks
    @urls_pick = @pars.urls_staff_picks
    Pick.create_picks(@names_pick, @urls_pick)
    
    @names_categoryes = @pars.all_names_categoryes
    @all_urls_category = @names_categoryes.map do |name_category|
        @pars.urls_one_category(name_category)
    end
    #TrendingApp.create_trending_app(@names_categoryes, @all_urls_category)
    
  end
end
