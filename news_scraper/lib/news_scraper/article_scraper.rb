class NewsScraper::ArticleScraper
  attr_accessor :title, :noko
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end
  def url
    code = 0
    @noko.css(".row").each do |link|
      puts "#{code}. #{link.css("h3").text.strip}"
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
