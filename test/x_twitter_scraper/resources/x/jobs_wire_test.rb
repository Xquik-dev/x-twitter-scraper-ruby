# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::XJobsWireTest < Minitest::Test
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

  def test_list_locations
    stub = stub_request(:get, "http://localhost/x/jobs/locations").with(query: {"q" => "q", "limit" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::JobLocations))

    response = client.x.jobs.list_locations(q: "q", limit: 1, fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::JobLocations, response)
  end

  def test_search
    stub = stub_request(:get, "http://localhost/x/jobs/search").with(query: {"q" => "q", "location" => "location", "locationId" => "location_id", "locationType" => "location_type", "seniority" => "seniority", "employmentType" => "employment_type", "company" => "company", "cursor" => "cursor", "pageSize" => "1", "fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::PaginatedJobs))

    response = client.x.jobs.search(
      q: "q",
      location: "location",
      location_id: "location_id",
      location_type: "location_type",
      seniority: "seniority",
      employment_type: "employment_type",
      company: "company",
      cursor: "cursor",
      page_size: 1,
      fields: "fields",
      omit: "omit"
    )

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::PaginatedJobs, response)
  end

  def test_retrieve
    stub = stub_request(:get, "http://localhost/x/jobs/id").with(query: {"fields" => "fields", "omit" => "omit"}).to_return_json(body: XTwitterScraper::Test::MockPayload.example(XTwitterScraper::Models::X::JobRetrieveResponse))

    response = client.x.jobs.retrieve("id", fields: "fields", omit: "omit")

    assert_requested(stub)
    assert_instance_of(XTwitterScraper::Models::X::JobRetrieveResponse, response)
  end
end
