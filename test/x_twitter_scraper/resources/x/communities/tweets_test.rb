# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Communities::TweetsTest < XTwitterScraper::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list(q: "q")

    assert_pattern do
      response => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet])
      }
    end
  end

  def test_list_by_community
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list_by_community("id")

    assert_pattern do
      response => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet])
      }
    end
  end
end
