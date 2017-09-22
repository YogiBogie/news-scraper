class NewsScraper::CLI
  attr_accessor :homepage, :headline, :option

  def call
    puts "Welcome to the News Scraper!"
    input = nil
    while input == nil || input.downcase == "y"
      puts "Below is a list of news sections you can select from."
      @headline = NewsScraper::HeadlineScraper.all
      if @headline.size == 0
        @homepage = NewsScraper::HomepageScraper.new
      end
      @homepage.show
      self.showSections
      self.showArticles
      puts "Would you like to see the list of news sections again?  Type 'Y' to see the list again, type in 'N' to quit program."
      input = gets.strip
    end
    puts "Goodbye"
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
        puts "Sorry but your entry does not match the options listed.  Please re-enter your answer."
      end
    end
  end

  def showArticles
    puts "Which article would you like to read?"
    entry = 0
    while entry < 1 || entry > @headline[@option.to_i - 1].item.size
      entry = gets.strip.to_i
      if entry > 0 && entry <= @headline[@option.to_i - 1].item.size
        puts @headline[@option.to_i - 1].item[entry - 1].scrape
      else
        puts "Your entry doesn't match the list of articles, please re-enter your selection."
      end
    end
  end

end
