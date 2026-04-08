# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Communities::TweetsTest < XTwitterScraper::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list(q: "q")

    assert_pattern do
      response => XTwitterScraper::Models::X::Communities::TweetListResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::Communities::TweetListResponse::Tweet])
      }
    end
  end
end
