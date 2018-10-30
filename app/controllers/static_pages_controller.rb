class StaticPagesController < ApplicationController

  def show
    @pars = Pars.new

    @names_blok_picks ||= @pars.names_blok_picks
    @urls_picks ||= @pars.all_urls_one_block(@names_blok_picks)
    Pick.create_picks(@names_blok_picks, @urls_picks)
    
    @names_blok_trending_apps ||= @pars.names_blok_trending_apps
    @urls_trending_apps ||= @pars.all_urls_one_block(@names_blok_trending_apps)
    TrendingApp.create_trending_app(@names_blok_trending_apps, @urls_trending_apps)
    
    @names_blok_plased_to_sell ||= @pars.names_blok_plased_to_sell
    @urls_plased_to_sell ||= @pars.all_urls_one_block(@names_blok_plased_to_sell)
    PlasedToSell.create_plased_to_sell(@names_blok_plased_to_sell, @urls_plased_to_sell)
    
    @pars.close_browser
  end
end
