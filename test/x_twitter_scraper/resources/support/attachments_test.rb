# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::Support::AttachmentsTest < XTwitterScraper::Test::ResourceTest
  def test_download
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.support.attachments.download("att_a1b2c3d4e5f6a1b2c3d4e5f6")

    assert_pattern do
      response => StringIO
    end
  end
end
