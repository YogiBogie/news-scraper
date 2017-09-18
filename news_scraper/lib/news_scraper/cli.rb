class NewsScraper::CLI

  def call
    puts "Welcome to the News Scraper!"
    puts "Below is a list of news sections you can select from."
    if NewsScraper::HeadlineScraper.all.size == 0
      homepage = NewsScraper::HomepageScraper.new
    end
    homepage.show
    puts "Please enter the number for the section you would like to see articles from:"
    option = gets.strip
    puts "Here are all the articles from the section you chose."
    if option.to_i > 0 && option.to_i < NewsScraper::HeadlineScraper.all.size
      articles = NewsScraper::HeadlineScraper.all[option.to_i - 1].item
      articles.each.with_index(1) {|article,idx| puts "#{idx}. #{article.title}"}
    else
      puts "Sorry but your entry does not match the options listed."
    end
    puts "Which article would you like to read?"
    entry = gets.strip.to_i
    if entry > 0 && entry < NewsScraper::HeadlineScraper.all[option.to_i - 1].item.size
      puts NewsScraper::HeadlineScraper.all[option.to_i - 1].item[entry - 1].scrape
    end
  end


end
