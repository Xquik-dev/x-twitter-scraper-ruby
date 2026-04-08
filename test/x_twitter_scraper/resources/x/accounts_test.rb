# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::AccountsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.accounts.create(
        email: "user@example.com",
        password: "s3cur3Pa$$w0rd",
        username: "elonmusk"
      )

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountCreateResponse
    end

    assert_pattern do
      response => {
        id: String,
        status: String,
        x_user_id: String,
        x_username: String
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.accounts.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::X::XAccountDetail
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        status: String,
        x_user_id: String,
        x_username: String,
        cookies_obtained_at: Time | nil,
        proxy_country: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.accounts.list

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountListResponse
    end

    assert_pattern do
      response => {
        accounts: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::XAccount])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.accounts.delete("id")

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountDeleteResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_bulk_retry
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.accounts.bulk_retry

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountBulkRetryResponse
    end

    assert_pattern do
      response => {
        cleared: Integer
      }
    end
  end

  def test_reauth_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.accounts.reauth("id", password: "password_value")

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountReauthResponse
    end

    assert_pattern do
      response => {
        id: String,
        status: String,
        x_username: String
      }
    end
  end
end
