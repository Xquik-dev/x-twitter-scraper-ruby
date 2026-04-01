# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::APIKeysTest < XTwitterScraper::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.api_keys.create

    assert_pattern do
      response => XTwitterScraper::Models::APIKeyCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        full_key: String,
        name: String,
        prefix: String
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.api_keys.list

    assert_pattern do
      response => XTwitterScraper::Models::APIKeyListResponse
    end

    assert_pattern do
      response => {
        keys: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::APIKeyListResponse::Key])
      }
    end
  end

  def test_revoke
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.api_keys.revoke("id")

    assert_pattern do
      response => XTwitterScraper::Models::APIKeyRevokeResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
