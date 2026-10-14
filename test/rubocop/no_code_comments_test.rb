# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../rubocop/cop/xquik/no_code_comments"

class NoCodeCommentsTest < Minitest::Test
  ROOT = File.expand_path("../..", __dir__)
  CONFIG = RuboCop::ConfigLoader.load_file(File.join(ROOT, ".rubocop.yml"))

  def offense_lines(source, path)
    processed = RuboCop::ProcessedSource.new(source, 3.2, File.join(ROOT, path))
    team = RuboCop::Cop::Team.mobilize([RuboCop::Cop::Xquik::NoCodeComments], CONFIG, raise_error: true)
    team.investigate(processed).offenses.map(&:line)
  end

  def test_keeps_legal_proof_and_directive_comments
    source = <<~RUBY
      # SPDX-FileCopyrightText: 2026 Xquik contributors
      #
      # SPDX-License-Identifier: Apache-2.0

      # frozen_string_literal: true

      # Net::HTTP keeps the socket open.
      # https://docs.ruby-lang.org/en/3.4/Net/HTTP.html
      KEEP_ALIVE = 1
      VALUE = 2 # rubocop:disable Style/NumericLiterals
    RUBY
    assert_equal([], offense_lines(source, "lib/x_twitter_scraper/internal/util.rb"))
  end

  def test_keeps_public_api_docs
    source = <<~RUBY
      module XTwitterScraper
        # Searches tweets.
        class Search
          # @!attribute q
          #   Query text.
          #
          #   @return [String]
          required :q, String

          # @!method initialize(q:)
          #   @param q [String]

          # Returns the query.
          def query(
            # The query text.
            text:
          ) = text
        end
      end
    RUBY
    assert_equal([], offense_lines(source, "lib/x_twitter_scraper/models/search.rb"))
  end

  def test_rejects_narration
    source = <<~RUBY
      module XTwitterScraper
        class Search
          def query
            # Explains the next line.
            value = 1
            value # says what value is
          end
        end
      end

      # First line.
      # Second line, still no proof.

      # Unrelated note.

      # https://example.com/doc
      VALUE = 1
    RUBY
    assert_equal([4, 6, 11, 12, 14], offense_lines(source, "lib/x_twitter_scraper/models/search.rb"))
  end

  def test_keeps_yard_public_api_docs_in_internal_code
    source = <<~RUBY
      module XTwitterScraper
        class BaseModel
          # @api public
          #
          # Returns the raw data.
          def to_h = @data
        end
      end
    RUBY
    assert_equal([], offense_lines(source, "lib/x_twitter_scraper/internal/type/base_model.rb"))
  end

  def test_rejects_docs_outside_the_public_api
    source = <<~RUBY
      module XTwitterScraper
        # Describes an internal helper.
        class Helper
        end
      end
    RUBY
    assert_equal([2], offense_lines(source, "lib/x_twitter_scraper/internal/helper.rb"))
  end
end
