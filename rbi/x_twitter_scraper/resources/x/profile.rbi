# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class Profile
        # Update X profile
        sig do
          params(
            account: String,
            idempotency_key: String,
            description: String,
            location: String,
            name: String,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateResponse)
        end
        def update(
          # Body param: X account (@username or ID) to update profile
          account:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param: Bio description
          description: nil,
          # Body param
          location: nil,
          # Body param: Display name
          name: nil,
          # Body param: Website URL
          url: nil,
          request_options: {}
        )
        end

        # Update profile avatar
        sig do
          params(
            account: String,
            url: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateAvatarResponse)
        end
        def update_avatar(
          # Body param: X account (@username or ID) receiving avatar from URL
          account:,
          # Body param: HTTPS URL to the avatar image to download
          url:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # Update profile banner
        sig do
          params(
            account: String,
            url: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::ProfileUpdateBannerResponse)
        end
        def update_banner(
          # Body param: X account (@username or ID) receiving banner from URL
          account:,
          # Body param: HTTPS URL to the banner image to download
          url:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
