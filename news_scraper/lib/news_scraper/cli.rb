class NewsScraper::CLI

  def call
    puts "Welcome to the News Scraper!"
    puts "Below is a list of news items you can select from."
    self.show_headings
  end

  def show_headings
    puts "DEF SHOW ARTICLES:"
    site = Nokogiri::HTML(open('http://www.nbcnews.com'))
    arr = []
    headings = site.css(".container-gutter .container .panel-group")
    headings.each{|link| arr << link.css(".panel-group_header .item-heading.item-heading_group").text.strip}
    arr[0] == arr[0].gsub("Latest","")
    arr.each.with_index(1){|heading, idx| puts  "#{idx}. #{heading}"}
    puts headings.css(".panel-group_header .item-heading.item-heading_group").text.strip
  end
end
