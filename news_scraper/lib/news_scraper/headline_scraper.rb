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
            @item[i].url = a['href']
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

end
