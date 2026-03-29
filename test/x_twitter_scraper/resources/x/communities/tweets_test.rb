# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Communities::TweetsTest < XTwitterScraper::Test::ResourceTest
  def test_list_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.tweets.list(q: "q")

    assert_pattern do
      response => nil
    end
  end
end
