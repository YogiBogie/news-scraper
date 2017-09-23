class NewsScraper::HomepageScraper
  attr_accessor :headline, :articles, :url, :headings
  @@all = []

  def initialize
    site = Nokogiri::HTML(open('https://www.nbcnews.com'))
    @headings = site.css(".container-gutter .container .panel-group")
  end

  def show
    if NewsScraper::HeadlineScraper.all.size == 0
      @headings.each do |link|
        headline = NewsScraper::HeadlineScraper.new
        headline.noko = link
        headline.title = link.css(".panel-group_header .item-heading.item-heading_group").first.text.strip
        headline.save
        if headline.title.include?("Local")
          headline.delete #Will delete Local news as an option because Local news has not been set on NBCNEWS site.
        end
      end
    end
    NewsScraper::HeadlineScraper.all.each.with_index(1){|heading, idx| puts  "#{idx}. #{heading.title}"}

  end



end
