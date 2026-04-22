# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::DmTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_history
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.dm.retrieve_history("userId")

    assert_pattern do
      response => XTwitterScraper::Models::X::DmRetrieveHistoryResponse
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        messages: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::DmRetrieveHistoryResponse::Message]),
        next_cursor: String
      }
    end
  end

  def test_send__required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.dm.send_("userId", account: "@elonmusk", text: "Example text content")

    assert_pattern do
      response => XTwitterScraper::Models::X::DmSendResponse
    end

    assert_pattern do
      response => {
        message_id: String,
        success: true | false
      }
    end
  end
end
