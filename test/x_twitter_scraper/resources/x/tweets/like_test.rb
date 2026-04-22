# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Tweets::LikeTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.like.create("id", account: "@elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::X::Tweets::LikeCreateResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.tweets.like.delete("id", account: "@elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::X::Tweets::LikeDeleteResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
