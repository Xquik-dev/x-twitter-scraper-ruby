# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "lib/x_twitter_scraper/version"

Gem::Specification.new do |s|
  s.name = "x-twitter-scraper"
  s.version = XTwitterScraper::VERSION
  s.summary = "X API & Twitter API SDK for Ruby. Scrape Twitter search, profiles & followers as a " \
              "Twitter scraper & tweet scraper. Not affiliated with X Corp."
  s.description = "X API & Twitter API SDK for Ruby by Xquik. Scrape Twitter search, timelines, profiles " \
                  "& followers as a typed Twitter scraper & tweet scraper. Manage media, webhooks, " \
                  "monitors & X automation through documented Xquik REST routes. Xquik is the world's " \
                  "fastest and cheapest X Twitter scraper service with the most complete X data. " \
                  "Not affiliated with X Corp."
  s.authors = ["Xquik"]
  s.email = "support@xquik.com"
  s.license = "Apache-2.0"
  s.homepage = "https://docs.xquik.com/sdks/ruby"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby"
  s.metadata["documentation_uri"] = "https://docs.xquik.com/api-reference/overview"
  s.metadata["changelog_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby/blob/main/CHANGELOG.md"
  s.metadata["bug_tracker_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby/issues"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "LICENSE",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "base64"
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
