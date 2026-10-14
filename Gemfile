# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

source "https://rubygems.org"

gemspec

group :development do
  gem "bundler-audit", "0.9.3"
  gem "parallel", "2.2.0"
  gem "rake", "13.4.2"
  gem "rbs", "4.2.0"
  gem "rubocop", "1.91.0"
  gem "sorbet", "0.6.13517"
  gem "steep", "2.1.0"
  gem "syntax_tree", "6.3.0"
  gem "syntax_tree-rbs",
      github: "ruby-syntax-tree/syntax_tree-rbs",
      ref: "247832988a850b8df050cf207f652872fda49973"
  gem "tapioca", "0.20.0"
end

group :development, :test do
  gem "async", "2.46.0"
  gem "minitest", "6.0.6"
  gem "minitest-focus", "1.4.1"
  gem "minitest-hooks", "1.5.4"
  gem "minitest-proveit", "1.0.1"
  gem "minitest-rg", "5.4.0"
  gem "webmock", "3.26.4"
end

group :development, :docs do
  gem "redcarpet", "3.6.1"
  gem "webrick", "1.9.2"
  gem "yard", "0.9.45"
end
