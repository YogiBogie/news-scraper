class NewsScraper::ArticleScraper
  attr_accessor :title, :noko, :url
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
