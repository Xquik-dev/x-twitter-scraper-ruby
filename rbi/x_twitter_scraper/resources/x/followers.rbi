# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Followers
        # Check follow relationship
        sig do
          params(
            source: String,
            target: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::FollowerCheckResponse)
        end
        def check(
          # Username to check (without @)
          source:,
          # Target username (without @)
          target:,
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
