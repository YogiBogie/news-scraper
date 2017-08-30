class NewsScraper::HeadlineScraper
  attr_accessor :title, :noko, :item
  @@all = []

  def noko=(noko)
    @noko=noko
    articles = @noko.css("h3")
    @item = []
    i=0
    articles.each do |link|
      @item[i] = NewsScraper::ArticleScraper.new(@noko)
      @item[i].title = link.text.strip
      #@item[i].url
      #puts @noko.css("story-link")
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
