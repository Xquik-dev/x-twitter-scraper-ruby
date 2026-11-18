# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class UserIdentityVerification < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute is_identity_verified
      #   Whether the owner verified their ID with X.
      #
      #   @return [Boolean, nil]
      optional :is_identity_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isIdentityVerified

      # @!attribute override_verified_year
      #   The year X shows as the start of verification, in place of verifiedSinceMsec.
      #
      #   @return [Integer, nil]
      optional :override_verified_year, Integer, api_name: :overrideVerifiedYear

      # @!attribute verified_since_msec
      #   When X verified the account, in milliseconds since 1970, as text.
      #
      #   @return [String, nil]
      optional :verified_since_msec, String, api_name: :verifiedSinceMsec

      # @!method initialize(description: nil, is_identity_verified: nil, override_verified_year: nil, verified_since_msec: nil)
      #   Identity verification X shows on the profile & its About page.
      #
      #   @param description [String]
      #
      #   @param is_identity_verified [Boolean] Whether the owner verified their ID with X.
      #
      #   @param override_verified_year [Integer] The year X shows as the start of verification, in place of verifiedSinceMsec.
      #
      #   @param verified_since_msec [String] When X verified the account, in milliseconds since 1970, as text.
    end
  end
end
