class NewsScraper::ArticleScraper
  attr_accessor :title, :noko, :url
  @@all=[]

  def initialize(noko=nil)
    @noko=noko
  end
  def url
    code = 0
    @noko.css(".row").each do |link|
      if link.css("h3").text.strip.length > 0 && code < 1#MAYBE I CAN DO SOMETHING WITH THE .eACH OF ROW WHERE I LOOK FOR H3 and then only then store the title and url all at once
        #link.css('a').each {|l| puts "#1 #{l}"}
        #puts "LINK= #{link.css('a').first['href']}"
        ant = 1
        link.css("h3").each do |h3|
          puts ant
          puts h3
          ant += 1
        end
        ent = 1
        link.css('a').each do |a|
          if a.css("h3").text.strip.length > 0
            puts ent
            puts a
            ent +=1
          end

        end#{"LINK= #{h3.css('a')}"
        #puts "TEXT= #{link.css('h3')}"
        puts code += 1
      end
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
