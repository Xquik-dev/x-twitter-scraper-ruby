# frozen_string_literal: true

require_relative "lib/x_twitter_scraper/version"

Gem::Specification.new do |s|
  s.name = "x-twitter-scraper"
  s.version = XTwitterScraper::VERSION
  s.summary = "Xquik Ruby SDK for tweet search, profile tweets, followers, webhooks, and automation. Not affiliated with X Corp."
  s.authors = ["X Twitter Scraper"]
  s.email = "support@xquik.com"
  s.licenses = ["Apache-2.0"]
  s.homepage = "https://docs.xquik.com/sdks/ruby"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["bug_tracker_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby/issues"
  s.metadata["changelog_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby/blob/main/CHANGELOG.md"
  s.metadata["documentation_uri"] = "https://gemdocs.org/gems/x-twitter-scraper"
  s.metadata["funding_uri"] = "https://xquik.com"
  s.metadata["source_code_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby"
  s.metadata["rubygems_mfa_required"] = true.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi", "~> 0.5"
  s.add_dependency "connection_pool", "~> 2.5"
end
