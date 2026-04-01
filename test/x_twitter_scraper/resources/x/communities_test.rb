# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::CommunitiesTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.create(account: "account", name: "name")

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityCreateResponse
    end

    assert_pattern do
      response => {
        community_id: String,
        success: true | false,
        community_name: String | nil
      }
    end
  end

  def test_delete_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.communities.delete("id", account: "account", community_name: "community_name")

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityDeleteResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_retrieve_info
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_info("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::CommunityRetrieveInfoResponse
    end

    assert_pattern do
      response => {
        community: XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
      }
    end
  end

  def test_retrieve_members
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_members("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_moderators
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_moderators("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_search_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.communities.retrieve_search(q: "q")

    assert_pattern do
      response => nil
    end
  end
end
