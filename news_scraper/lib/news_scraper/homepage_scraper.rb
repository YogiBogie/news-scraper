class NewsScraper::HomepageScraper
  attr_accessor :headline, :articles, :url
  @@all = []

  def show
    puts "DEF SHOW ARTICLES:"
    site = Nokogiri::HTML(open('https://www.nbcnews.com'))
    headings = site.css(".container-gutter .container .panel-group")
    headings.each do |link|
      headline = NewsScraper::HeadlineScraper.new
      headline.noko = link
      headline.title = link.css(".panel-group_header .item-heading.item-heading_group").text.strip
      headline.save
    end
    NewsScraper::HeadlineScraper.all.each.with_index(1){|heading, idx| puts  "#{idx}. #{heading.title}"}
    #puts headings.css(".panel-group_header .item-heading.item-heading_group").text.strip
  end



end
