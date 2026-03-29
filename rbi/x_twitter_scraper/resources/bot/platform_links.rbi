# typed: strong

module XTwitterScraper
  module Resources
    class Bot
      # Telegram bot service endpoints
      class PlatformLinks
        # Link a platform user to an Xquik account
        sig do
          params(
            platform:
              XTwitterScraper::Bot::PlatformLinkCreateParams::Platform::OrSymbol,
            platform_user_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Bot::PlatformLinkCreateResponse)
        end
        def create(platform:, platform_user_id:, request_options: {})
        end

        # Unlink a platform user from an Xquik account
        sig do
          params(
            platform:
              XTwitterScraper::Bot::PlatformLinkDeleteParams::Platform::OrSymbol,
            platform_user_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Bot::PlatformLinkDeleteResponse)
        end
        def delete(platform:, platform_user_id:, request_options: {})
        end

        # Look up an Xquik user by platform identity
        sig do
          params(
            platform: String,
            platform_user_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::Bot::PlatformLinkLookupResponse)
        end
        def lookup(platform:, platform_user_id:, request_options: {})
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
