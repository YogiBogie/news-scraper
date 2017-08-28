class NewsScraper::ArticleScraper
  attr_accessor :title, :url
  @@all=[]

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
