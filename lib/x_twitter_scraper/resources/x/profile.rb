# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class Profile
        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::ProfileUpdateParams} for more details.
        #
        # Update X profile
        #
        # @overload update(account:, idempotency_key:, description: nil, location: nil, name: nil, url: nil, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) to update profile
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param description [String] Body param: Bio description
        #
        # @param location [String] Body param
        #
        # @param name [String] Body param: Display name
        #
        # @param url [String] Body param: Website URL
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateParams
        def update(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :patch,
            path: "x/profile",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::ProfileUpdateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::ProfileUpdateAvatarParams} for more details.
        #
        # Update profile avatar
        #
        # @overload update_avatar(account:, url:, idempotency_key:, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) receiving avatar from URL
        #
        # @param url [String] Body param: HTTPS URL to the avatar image to download
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateAvatarResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateAvatarParams
        def update_avatar(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateAvatarParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :patch,
            path: "x/profile/avatar",
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::ProfileUpdateAvatarResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::ProfileUpdateBannerParams} for more details.
        #
        # Update profile banner
        #
        # @overload update_banner(account:, url:, idempotency_key:, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) receiving banner from URL
        #
        # @param url [String] Body param: HTTPS URL to the banner image to download
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateBannerResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateBannerParams
        def update_banner(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateBannerParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :patch,
            path: "x/profile/banner",
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
            model: XTwitterScraper::Models::X::ProfileUpdateBannerResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
