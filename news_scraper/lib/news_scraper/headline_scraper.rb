class NewsScraper::HeadlineScraper
  attr_accessor :title, :noko, :item
  @@all = []

  def noko=(noko)
    @noko=noko
    articles = @noko.css("h3")
    @item = []
    i=0
    articles.each do |link|
      @item[i] = NewsScraper::ArticleScraper.new
      @item[i].title = link.text.strip
      #@item.url =
      @item[i].save
      i+=1
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
