# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::FollowersTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_check_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.followers.retrieve_check(source: "source", target: "target")

    assert_pattern do
      response => XTwitterScraper::Models::X::FollowerRetrieveCheckResponse
    end

    assert_pattern do
      response => {
        is_followed_by: XTwitterScraper::Internal::Type::Boolean,
        is_following: XTwitterScraper::Internal::Type::Boolean,
        source_username: String,
        target_username: String
      }
    end
  end
end
