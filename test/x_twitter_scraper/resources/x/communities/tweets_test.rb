# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Communities::TweetsTest < XTwitterScraper::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list(q: "q")

    assert_pattern do
      response => XTwitterScraper::Internal::CursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      row => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::SearchTweet])
      }
    end
  end

  def test_list_by_community
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list_by_community("id")

    assert_pattern do
      response => XTwitterScraper::Internal::CursorPage
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      row => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::SearchTweet])
      }
    end
  end
end
