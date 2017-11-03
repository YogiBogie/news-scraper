# NewsScraper

Welcome to NewsScraper CLI Data Scraper.  This scraper is designed to scrape news stories from the https://NBCNews.com website.  

NBCNews.com groups articles into what I call 'Headlines', a numbered list of these headlines will be shown to the user.  They will choose which headline they want to see articles from, these articles will be shown in a numbered list to the user.  User then chooses which article to view.  If article is text based this will be shown on screen to user, if it is video based a line will be presented to user so they can click on it and view in browser.

Lastly, the user will be asked if they wish to see list of headlines again or if they wish to exit program.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'news_scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install news_scraper

## Usage

Step 1 - User runs NewsScraper Data Gem.
Step 2 - Once users run NewsScraper they will be presented with a numbered list of all 'Headlines' on the NBCNews site and will be asked to select which headline they would like to read articles from.
Step 3 - User will choose a headline by entering number of headline they are interested.
Step 4 - Once they enter the number of the headline they wish to see articles about they will be presented with a numbered list of articles from which to choose.  
Step 5 - User chooses which article they would like to read/view
Step 6 - Program will determine if article is text based or video.  
  Step 6a - If video, user will be given link to click on to open video in browswer
  Step 6b - If text based, user will be shown article title, author/date published (if applicable) and article text
Step 7 - User will be asked if they would like to list of headlines or if they wish to exit
Step 8 - If user wishes to see list again then we go back to Step 2 otherwise program ends

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/YogiBogie/news_scraper.
