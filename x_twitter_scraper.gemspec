# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "lib/x_twitter_scraper/version"

Gem::Specification.new do |s|
  s.name = "x-twitter-scraper"
  s.version = XTwitterScraper::VERSION
  s.summary = "Ruby SDK for the Xquik API"
  s.authors = ["Xquik"]
  s.email = "support@xquik.com"
  s.license = "Apache-2.0"
  s.homepage = "https://docs.xquik.com/sdks/ruby"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/Xquik-dev/x-twitter-scraper-ruby"
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
