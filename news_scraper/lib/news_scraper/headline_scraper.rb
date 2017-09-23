class NewsScraper::HeadlineScraper
  attr_accessor :title, :noko, :item
  @@all = []

  def noko=(noko)
    @noko=noko
    @item = []
    i=0
    code=0
    @noko.css(".row").each do |link|
      if link.css("h3").text.strip.length > 0 && code < 1
        link.css('a').each do |a|
          if a.css("h3").text.strip.length > 0
            @item[i] = NewsScraper::ArticleScraper.new(@noko)
            @item[i].title = a.css("h3").text.strip
            url_text = a['href']
            url_text.include?(".com") ? @item[i].url = url_text : @item[i].url = "https://www.nbcnews.com" + url_text
            @item[i].save
            i+=1
          end
        code +=1
        end
      end
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def delete
    @@all.pop
  end

end
