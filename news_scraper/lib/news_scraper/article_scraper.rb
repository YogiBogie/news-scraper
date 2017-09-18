class NewsScraper::ArticleScraper
  attr_accessor :title, :noko, :url, :date, :heading, :author, :p_text
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end

  def scrape
    site = Nokogiri::HTML(open(self.url))
    @heading = site.css("h1").text
    @date = site.css(".timestamp_article").text
    @author = site.css(".byline_author").text
    @p_text = site.css("p").text
    puts heading
    puts "\tPosted: #{date}"
    puts "\tAuthor or Original News Site: #{author}"
    p_text.each do |ptext|
      puts ptext
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
