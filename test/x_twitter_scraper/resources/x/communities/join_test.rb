# frozen_string_literal: true

require_relative "../../../test_helper"

class XTwitterScraper::Test::Resources::X::Communities::JoinTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.join.create("id", account: "account")

    assert_pattern do
      response => XTwitterScraper::X::CommunityActionResult
    end

    assert_pattern do
      response => {
        community_id: String,
        community_name: String,
        success: true | false
      }
    end
  end

  def test_delete_all_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.join.delete_all("id", account: "account")

    assert_pattern do
      response => XTwitterScraper::X::CommunityActionResult
    end

    assert_pattern do
      response => {
        community_id: String,
        community_name: String,
        success: true | false
      }
    end
  end
end
