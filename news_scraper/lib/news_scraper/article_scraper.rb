class NewsScraper::ArticleScraper
  attr_accessor :title, :noko, :url, :date, :heading, :author, :p_txt
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end

  def scrape
    @noko = Nokogiri::HTML(open(self.url))
    url_link = self.url
    case url_link
    when /nbcsports.com/
      self.scrapeSports
    when /watch/
      self.openUrl
    when /video/
      self.openUrl
    when /better/
      self.scrapeBetter
    when /nbcnews.com/
      self.scrapeNBCNews
    when /local/
      self.scrapeLocal
    end

  end

  def scrapeNBCNews
    @heading = @noko.css("h1").text
    @date = @noko.css(".timestamp_article").text
    @author = @noko.css(".byline_author").text
    ptext = @noko.css("p")
    @p_txt =""
    ptext.each do |x|
      @p_txt += "\n#{x.text}"
    end
    self.printArticle
  end

  def scrapeSports
    puts "nbcsports.com"
    @heading = @noko.css(".entry-title").text
    @author = @noko.css(".byline").text
    @date = @noko.css(".posted-on").text
    ptext = @noko.css(".entry-content p")
    @p_txt =""
    ptext.each do |x|
      @p_txt += "\n#{x.text}"
    end
    self.printArticle
  end

  def scrapeBetter
    @heading = @noko.css("h1").first.text.strip
    @date = @noko.css("._pubDate_1awpa_72").text
    @author = @noko.css(".authorItem span").text.strip
    ptext = @noko.css("article p")
    @p_txt =""
    ptext.each do |x|
      @p_txt += "\n#{x.text}"
    end
    self.printArticle
  end

  def openUrl
    puts "This article is in video format.  Please click on the link below to view the video."
    puts "Please click here: #{self.url}"

  end

  def printArticle
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
