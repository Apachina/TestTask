class Pars
  attr_reader :doc

  def staff_picks
    get_html unless @doc
    names_picks('.ui-featured-app-card__title.visually-hidden')
  end

  def urls_staff_picks
    get_html unless @doc
    @doc.css('.ui-featured-app-card__byline').css("a[href]").map{|el| el['href']}
  end

  def all_names_categoryes
    get_html unless @doc
    names_blocks('.heading--3.app-collection__heading')
  end

  def urls_one_category(category)
    ind = all_names_categoryes.index(category)
    links_categoryes[ind]
  end

  def categoryes
    get_html unless @doc
    h = {}
    names_blocks('.heading--3.app-collection__heading').each.with_index.each_with_object(Hash.new) do |(name,index), hash|
      h['links'] = links_categoryes[index].each.with_index.each_with_object(Hash.new) do |(link, k), hsh|
        hsh[k] = link
      end
      hash[name] = h['links']
    end
  end

  private

    def names_picks(find_by)
      names_blocks(find_by)
    end

    def names_blocks(find_by)
      @doc.css(find_by).map(&:text)
    end

    def links_categoryes
      @doc.css('.section.section--tight.app-collection').map{|a| a.css(".app-collection__item").css("a[href]").map{|el| el['href']}}
    end

    def open_url
      url = 'https://apps.shopify.com/'
      open(url)
    end
    
    def get_html
      @doc = Nokogiri::HTML(open_url)
    end
end