# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::FollowersTest < XTwitterScraper::Test::ResourceTest
  def test_check_required_params
    response = @x_twitter_scraper.x.followers.check(source: "source", target: "target")

    assert_pattern do
      response => XTwitterScraper::Models::X::FollowerCheckResponse
    end

    assert_pattern do
      response => {
        is_followed_by: XTwitterScraper::Internal::Type::Boolean,
        is_following: XTwitterScraper::Internal::Type::Boolean,
        source_username: String,
        target_username: String
      }
    end
  end
end
