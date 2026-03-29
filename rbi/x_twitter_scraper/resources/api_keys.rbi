# typed: strong

module XTwitterScraper
  module Resources
    # API key management (session auth only)
    class APIKeys
      # Create API key
      sig do
        params(
          name: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::APIKeyCreateResponse)
      end
      def create(name: nil, request_options: {})
      end

      # List API keys
      sig do
        params(
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::APIKeyListResponse)
      end
      def list(request_options: {})
      end

      # Revoke API key
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::APIKeyRevokeResponse)
      end
      def revoke(
        # Resource ID (stringified bigint)
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
