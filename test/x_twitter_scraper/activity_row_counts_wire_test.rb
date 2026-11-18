# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::ActivityRowCountsWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  ROW = {
    time: "2026-11-18T03:00:00.000Z",
    category: "extractions",
    type: "extraction",
    activity: "Reply extraction",
    status: "completed",
    source: "API",
    target: "@NASA",
    details: "",
    id: "act_1",
    link: "https://xquik.com/dashboard/activity/act_1"
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
    XTwitterScraper::Client.new(base_url: "http://localhost", api_key: "My API Key", max_retries: 0)
  end

  def test_each_row_reads_the_counts_the_api_sent
    stub_request(:get, "http://localhost/activity").to_return_json(
      body: [
        {**ROW, results: "", credits: ""},
        {**ROW, results: "abc", credits: "n/a"},
        {**ROW, results: 12, credits: 3}
      ]
    )

    rows = client.activity.list

    assert_equal([["", ""], ["abc", "n/a"], [12, 3]], rows.map { [_1.results, _1.credits] })
  end
end
