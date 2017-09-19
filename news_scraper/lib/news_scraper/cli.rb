class NewsScraper::CLI
  attr_accessor :homepage, :headline, :option

  def call
    puts "Welcome to the News Scraper!"
    puts "Below is a list of news sections you can select from."
    @headline = NewsScraper::HeadlineScraper.all
    if @headline.size == 0
      @homepage = NewsScraper::HomepageScraper.new
    end
    @homepage.show
    self.showSections
    puts "Which article would you like to read?"
    entry = gets.strip.to_i
    if entry > 0 && entry < NewsScraper::HeadlineScraper.all[@option.to_i - 1].item.size
      puts NewsScraper::HeadlineScraper.all[option.to_i - 1].item[entry - 1].scrape
    end
  end

  def showSections
    puts "Please enter the number for the section you would like to see articles from:"
    @option = 0
    while @option.to_i < 1 || @option.to_i > @headline.size
      @option = gets.strip
      if @option.to_i > 0 && @option.to_i <= @headline.size
        puts "Here are all the articles from the section you chose."
        articles = @headline[@option.to_i - 1].item
        articles.each.with_index(1) {|article,idx| puts "#{idx}. #{article.title}"}
      else
        puts "Sorry but your entry does not match the options listed."
      end
    end
  end

end
