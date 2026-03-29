# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::DmTest < XTwitterScraper::Test::ResourceTest
  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.dm.update("userId", account: "account", text: "text")

    assert_pattern do
      response => XTwitterScraper::Models::X::DmUpdateResponse
    end

    assert_pattern do
      response => {
        message_id: String,
        success: true | false
      }
    end
  end

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
end
