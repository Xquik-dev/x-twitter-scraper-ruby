# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::DraftIgnoredFieldsWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  DRAFT = {
    id: "d1",
    text: "hello",
    createdAt: "2026-11-09T00:00:00.000Z",
    updatedAt: "2026-11-09T00:00:00.000Z"
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

  def test_create_reads_the_fields_the_route_ignored
    stub_request(:post, "http://localhost/drafts")
      .to_return_json(body: DRAFT.merge(ignoredFields: ["plan"]))

    draft = client.drafts.create(text: "hello")

    assert_kind_of(XTwitterScraper::DraftDetail, draft)
    assert_equal(["plan"], draft.ignored_fields)
    assert_equal("d1", draft.id)
  end

  def test_create_leaves_ignored_fields_empty_when_the_route_read_every_field
    stub_request(:post, "http://localhost/drafts").to_return_json(body: DRAFT)

    assert_nil(client.drafts.create(text: "hello").ignored_fields)
  end
end
