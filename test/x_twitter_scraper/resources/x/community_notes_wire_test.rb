# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XCommunityNotesWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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
      bearer_token: "My Bearer Token",
      max_retries: 0
    )
  end

  def test_retrieve_contributor
    stub = stub_request(:get, "http://localhost/x/community-notes/contributors/alias_").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse))

    response = client.x.community_notes.retrieve_contributor("alias_", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse, response)
  end

  def test_list_contributor_deleted_notes
    stub = stub_request(:get, "http://localhost/x/community-notes/contributors/alias_/deleted-notes").with(query: {"cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedCommunityNotes))

    response = client.x.community_notes.list_contributor_deleted_notes(
      "alias_",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedCommunityNotes, response)
  end

  def test_list_contributor_notes
    stub = stub_request(:get, "http://localhost/x/community-notes/contributors/alias_/notes").with(query: {"cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedCommunityNotes))

    response = client.x.community_notes.list_contributor_notes(
      "alias_",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedCommunityNotes, response)
  end
end
