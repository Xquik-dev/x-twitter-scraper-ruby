# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::Resources::DraftsTest < XTwitterScraper::Test::ResourceTest
  def test_create_required_params
    response = @x_twitter_scraper.drafts.create(text: "AI is the future of productivity")

    assert_pattern do
      response => XTwitterScraper::DraftDetail
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        text: String,
        updated_at: Time,
        goal: String | nil,
        topic: String | nil
      }
    end
  end

  def test_retrieve
    response = @x_twitter_scraper.drafts.retrieve("id")

    assert_pattern do
      response => XTwitterScraper::DraftDetail
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        text: String,
        updated_at: Time,
        goal: String | nil,
        topic: String | nil
      }
    end
  end

  def test_list
    response = @x_twitter_scraper.drafts.list

    assert_pattern do
      response => XTwitterScraper::Models::DraftListResponse
    end

    assert_pattern do
      response => {
        drafts: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Draft]),
        has_more: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String | nil
      }
    end
  end

  def test_delete
    response = @x_twitter_scraper.drafts.delete("id")

    assert_pattern do
      response => nil
    end
  end
end
