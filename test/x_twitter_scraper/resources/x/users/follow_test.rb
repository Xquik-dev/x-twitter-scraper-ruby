# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Users::FollowTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.follow.create("id", account: "@elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::X::Users::FollowCreateResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_delete_all_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.users.follow.delete_all("id", account: "@elonmusk")

    assert_pattern do
      response => XTwitterScraper::Models::X::Users::FollowDeleteAllResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
