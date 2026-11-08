# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraper::Test::AccountConnectionWireTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  ATTEMPT_ID = "xatt_0123456789abcdef0123456789abcdef"
  PENDING = {
    object: "x_account_connection_attempt",
    id: ATTEMPT_ID,
    status: "pending",
    pollAfterMs: 2000
  }.freeze
  CHALLENGE = {
    object: "x_account_connection_challenge",
    id: "xcc_0123456789abcdef0123456789abcdef",
    status: "requires_email_code",
    expiresAt: "2026-11-09T00:15:00.000Z",
    message: "Enter the code X sent to the account's email.",
    username: "your_x_username"
  }.freeze
  ACCOUNT = {
    id: "42",
    xUserId: "1234567890",
    xUsername: "your_x_username",
    status: "active",
    health: "healthy",
    createdAt: "2026-11-09T00:00:00.000Z"
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

  def test_create_sends_the_connection_attempt_id
    stub_request(:post, "http://localhost/x/accounts").to_return_json(status: 202, body: PENDING)
    fields = {
      email: "account@example.invalid",
      password: "<ACCOUNT_PASSWORD>",
      totp_secret: "<TOTP_SECRET>",
      username: "your_x_username",
      connection_attempt_id: ATTEMPT_ID
    }

    response = client.x.accounts.create(**fields)

    assert_equal(ATTEMPT_ID, XTwitterScraper::X::AccountCreateParams.new(**fields).connection_attempt_id)
    assert_requested(
      :post,
      "http://localhost/x/accounts",
      body: hash_including("connection_attempt_id" => ATTEMPT_ID)
    )
    assert_instance_of(XTwitterScraper::Models::X::AccountCreateResponse::XAccountConnectionAttemptPending, response)
  end

  def test_reauth_sends_the_connection_attempt_id_and_reads_a_pending_answer
    stub_request(:post, "http://localhost/x/accounts/42/reauth").to_return_json(status: 202, body: PENDING)
    fields = {password: "<ACCOUNT_PASSWORD>", connection_attempt_id: ATTEMPT_ID}

    response = client.x.accounts.reauth("42", **fields)

    assert_equal(ATTEMPT_ID, XTwitterScraper::X::AccountReauthParams.new(**fields).connection_attempt_id)
    assert_requested(
      :post,
      "http://localhost/x/accounts/42/reauth",
      body: hash_including("connection_attempt_id" => ATTEMPT_ID)
    )
    assert_instance_of(XTwitterScraper::Models::X::AccountReauthResponse::XAccountConnectionAttemptPending, response)
    assert_equal([ATTEMPT_ID, :pending, 2000], [response.id, response.status, response.poll_after_ms])
  end

  def test_reauth_reads_an_email_code_challenge
    stub_request(:post, "http://localhost/x/accounts/42/reauth").to_return_json(status: 202, body: CHALLENGE)

    response = client.x.accounts.reauth("42", password: "<ACCOUNT_PASSWORD>")

    assert_instance_of(XTwitterScraper::Models::X::AccountReauthResponse::XAccountConnectionChallenge, response)
    assert_equal(:requires_email_code, response.status)
    assert_equal(Time.utc(2026, 11, 9, 0, 15), response.expires_at)
    assert_equal("your_x_username", response.username)
  end

  def test_reauth_reads_the_signed_in_account
    stub_request(:post, "http://localhost/x/accounts/42/reauth").to_return_json(status: 200, body: ACCOUNT)

    response = client.x.accounts.reauth("42", password: "<ACCOUNT_PASSWORD>")

    assert_instance_of(XTwitterScraper::Models::X::AccountReauthResponse::SanitizedXAccount, response)
    assert_equal(["your_x_username", :healthy], [response.x_username, response.health])
    assert_equal(:healthy, XTwitterScraper::Models::X::AccountReauthResponse::Health::HEALTHY)
  end

  def test_attempt_success_names_the_connected_account
    success = {object: "x_account_connection_attempt", id: ATTEMPT_ID, accountId: "42", status: "success"}
    stub_request(:get, "http://localhost/x/account-connection-attempts/#{ATTEMPT_ID}")
      .to_return_json(status: 200, body: success)

    response = client.x.account_connection_attempts.retrieve(ATTEMPT_ID)

    assert_instance_of(XTwitterScraper::Models::X::AccountConnectionAttemptRetrieveResponse::Success, response)
    assert_equal("42", response.account_id)
  end
end
