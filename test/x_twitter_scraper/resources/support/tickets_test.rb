# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::Support::TicketsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    response =
      @x_twitter_scraper.support.tickets.create(
        body: "I am unable to connect my X account. Please help.",
        subject: "Cannot connect X account"
      )

    assert_pattern do
      response => XTwitterScraper::Models::Support::TicketCreateResponse
    end

    assert_pattern do
      response => {
        attachments: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketCreateResponse::Attachment]),
        public_id: String
      }
    end
  end

  def test_retrieve
    response = @x_twitter_scraper.support.tickets.retrieve("tkt_a1b2c3d4e5f6a1b2c3d4e5f6")

    assert_pattern do
      response => XTwitterScraper::Models::Support::TicketRetrieveResponse
    end

    assert_pattern do
      response => {
        created_at: Time | nil,
        messages: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketRetrieveResponse::Message]) | nil,
        public_id: String | nil,
        status: String | nil,
        subject: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update_required_params
    response = @x_twitter_scraper.support.tickets.update("tkt_a1b2c3d4e5f6a1b2c3d4e5f6", status: :resolved)

    assert_pattern do
      response => XTwitterScraper::Models::Support::TicketUpdateResponse
    end

    assert_pattern do
      response => {
        public_id: String | nil,
        status: String | nil
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.support.tickets.list

    assert_pattern do
      response => XTwitterScraper::Models::Support::TicketListResponse
    end

    assert_pattern do
      response => {
        tickets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketListResponse::Ticket]) | nil
      }
    end
  end

  def test_reply_required_params
    response =
      @x_twitter_scraper.support.tickets.reply(
        "tkt_a1b2c3d4e5f6a1b2c3d4e5f6",
        body: "Thank you for the update."
      )

    assert_pattern do
      response => XTwitterScraper::Models::Support::TicketReplyResponse
    end

    assert_pattern do
      response => {
        attachments: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::Support::TicketReplyResponse::Attachment]),
        public_id: String
      }
    end
  end
end
