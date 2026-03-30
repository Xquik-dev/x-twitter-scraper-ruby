# typed: strong

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
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
        # Resource ID (stringified bigint)
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
