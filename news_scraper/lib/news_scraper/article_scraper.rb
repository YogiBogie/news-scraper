class NewsScraper::ArticleScraper
  attr_accessor :title, :url, :noko
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
    self.title = @noko.css("h3").text.strip
    #temp = @noko.css(".story-link a")
    #@item[i].url = temp["href"]
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
