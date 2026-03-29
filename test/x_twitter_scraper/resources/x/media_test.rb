# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::MediaTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.media.create(account: "account", file: StringIO.new("Example data"))

    assert_pattern do
      response => XTwitterScraper::Models::X::MediaCreateResponse
    end

    assert_pattern do
      response => {
        media_id: String,
        success: true | false
      }
    end
  end

  def test_download
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.media.download

    assert_pattern do
      response => XTwitterScraper::Models::X::MediaDownloadResponse
    end

    assert_pattern do
      response => {
        cache_hit: XTwitterScraper::Internal::Type::Boolean | nil,
        gallery_url: String | nil,
        total_media: Integer | nil,
        total_tweets: Integer | nil,
        tweet_id: String | nil
      }
    end
  end
end
