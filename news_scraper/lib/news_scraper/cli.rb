class NewsScraper::CLI

  def call
    puts "Welcome to the News Scraper!"
    puts "Below is a list of news items you can select from."
    if NewsScraper::HeadlineScraper.all.size == 0
      homepage = NewsScraper::HomepageScraper.new
    end
    homepage.show
    option = gets.strip
    if option.to_i > 0 && option.to_i < NewsScraper::HeadlineScraper.all.size
      articles = NewsScraper::HeadlineScraper.all[option.to_i - 1].item
      articles.each.with_index(1) {|article,idx| puts "#{idx}. #{article.title}"}
    else
      puts "Sorry but your entry does not match the options listed."
    end
  end


end
