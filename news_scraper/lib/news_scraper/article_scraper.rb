class NewsScraper::ArticleScraper
  attr_accessor :title, :noko, :url, :date, :heading, :author, :p_txt
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end

  def scrape
    site = Nokogiri::HTML(open(self.url))
    if self.url.include?("nbcsports.com")
      @heading = site.css(".entry-title").text
      @date = site.css(".entry-date published").text
      ptext = site.css(".entry-content p")
      @p_txt =""
      ptext.each do |x|
        @p_txt += "\n#{x.text}"
      end
    else
      @heading = site.css("h1").text
      @date = site.css(".timestamp_article").text
      @author = site.css(".byline_author").text
      ptext = site.css("p")
      @p_txt =""
      ptext.each do |x|
        @p_txt += "\n#{x.text}"
      end
    end

    puts heading
    if @date != nil
      puts "\tPosted: #{date}"
    end
    puts "\tAuthor or Original News Site: #{author}"
    puts p_txt

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
