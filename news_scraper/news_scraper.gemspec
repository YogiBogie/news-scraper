# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'news_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "news_scraper"
  spec.version       = NewsScraper::VERSION
  spec.authors       = ["Jorge Cossi"]
  spec.email         = ["jorge_cossi@yahoo.com"]

  spec.summary       = "Newsite Scraper built for flatironschool"
  spec.description   = "Newsite scrapper built to scrape NBCNews.com.  User will be able to select from a list of news articles to specify which they wish to have more info on."
  spec.homepage      = "https://github.com/YogiBogie/news-scraper"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
