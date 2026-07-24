# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::AccountConnectionChallengesTest < XTwitterScraper::Test::ResourceTest
  def test_submit_required_params
    response =
      @x_twitter_scraper.x.account_connection_challenges.submit("id", email_code: "<EMAIL_VERIFICATION_CODE>")

    assert_pattern do
      response => XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        health: XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health,
        status: String,
        x_user_id: String,
        x_username: String
      }
    end
  end
end
