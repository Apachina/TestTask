Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

class Pars
  attr_accessor :session
  MAIN_PAGE = "https://apps.shopify.com/".freeze

  def names_blok_picks
    have_open_browser?
    all_nemes_block('.ui-featured-app-card__byline','div a')
  end

  def names_blok_trending_apps
    have_open_browser?
    @session.all(".section.section--tight.app-collection")
                  .first
                  .all('.ui-app-card__name')
                  .map(&:text)
  end

  def names_blok_plased_to_sell
    have_open_browser?
    @session.find_link("See more Places to sell apps").click
    all_nemes_block(".grid__item.grid__item--tablet-up-half.grid-item--app-card-listing", '.ui-app-card__name')
  end

  def all_urls_one_block(names_one_blocks)
    find_url(names_one_blocks)
  end

  def close_browser
    @session.driver.browser.close
  end

  private
    def have_open_browser?
      if !@session 
        open_main_page
      else @session.current_url != MAIN_PAGE
        @session.find(".app-store-logo").click
      end
    end

    def all_nemes_block(section,find_by)
        @session.all(section).map{|a| a.find(find_by).text}
    end

    def find_url(links_name)
      links_name.map do |link_name| 
        @session.find_link(link_name, match: :first)[:href]
      end
    end
    
    def open_main_page
      @session = Capybara::Session.new(:selenium)
      @session.visit(MAIN_PAGE)
    end
end