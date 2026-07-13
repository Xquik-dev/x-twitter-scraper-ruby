# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class WriteActions
        # Get write action status
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::WriteActionRetrieveResponse)
        end
        def retrieve(
          # Write action ID returned by a pending write response.
          id,
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
