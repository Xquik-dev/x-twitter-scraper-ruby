# typed: strong

module XTwitterScraper
  module Resources
    # AI tweet composition, drafts, writing styles, and radar
    class Drafts
      # Save a tweet draft
      sig do
        params(
          text: String,
          goal: XTwitterScraper::DraftCreateParams::Goal::OrSymbol,
          topic: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::DraftDetail)
      end
      def create(text:, goal: nil, topic: nil, request_options: {})
      end

      # Get draft by ID
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::DraftDetail)
      end
      def retrieve(
        # Resource ID returned by the matching create or list endpoint.
        id,
        request_options: {}
      )
      end

      # List saved drafts
      sig do
        params(
          after_cursor: String,
          limit: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(XTwitterScraper::Models::DraftListResponse)
      end
      def list(
        # Cursor for pagination
        after_cursor: nil,
        # Maximum number of items to return (1-100, default 50). For paid per-result
        # endpoints, the returned count may be lower when remaining credits cannot cover
        # the requested page. If zero paid results are affordable, the endpoint returns
        # 402 insufficient_credits.
        limit: nil,
        request_options: {}
      )
      end

      # Delete a draft
      sig do
        params(
          id: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Resource ID returned by the matching create or list endpoint.
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
