# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::CommunityCreatorWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  CREATOR = {
    id: "1234567890",
    username: "community_owner",
    name: "Community Owner",
    verified: true,
    followers: 4200,
    accountBasedIn: {value: "Canada", level: "country", observedAt: "2026-11-01T00:00:00.000Z"},
    affiliatesHighlightedLabel: {
      description: "Example Org",
      longDescription: {text: "Works at Example Org"},
      auxiliaryLabels: [{description: "Example Lab", userLabelType: "BusinessLabel"}]
    },
    identityVerification: {isIdentityVerified: true, overrideVerifiedYear: 2024}
  }.freeze

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def client
    XTwitterScraper::Client.new(
      base_url: "http://localhost",
      api_key: "My API Key",
      bearer_token: "My Bearer Token"
    )
  end

  def test_retrieve_info_reads_the_creator_profile_fields
    stub_request(:get, "http://localhost/x/communities/99/info")
      .to_return_json(body: {community: {id: "99", name: "Example", creator: CREATOR}})

    creator = client.x.communities.retrieve_info("99").community.creator
    label = creator.affiliates_highlighted_label

    assert_kind_of(XTwitterScraper::Models::UserProfile, creator)
    assert_equal(["1234567890", "community_owner", true], [creator.id, creator.username, creator.verified])
    assert_equal(4200, creator.followers)
    assert_equal(["Canada", :country], [creator.account_based_in.value, creator.account_based_in.level])
    assert_equal("Example Lab", label.auxiliary_labels.first.description)
    assert_equal({text: "Works at Example Org"}, label.long_description)
    assert_equal(2024, creator.identity_verification.override_verified_year)
  end
end
