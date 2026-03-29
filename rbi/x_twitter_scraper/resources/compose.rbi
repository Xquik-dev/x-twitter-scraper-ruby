# typed: strong

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Compose
      # Compose, refine, or score a tweet
      sig do
        params(
          step: XTwitterScraper::ComposeCreateParams::Step::OrSymbol,
          additional_context: String,
          call_to_action: String,
          draft: String,
          goal: XTwitterScraper::ComposeCreateParams::Goal::OrSymbol,
          has_link: T::Boolean,
          has_media: T::Boolean,
          media_type: XTwitterScraper::ComposeCreateParams::MediaType::OrSymbol,
          style_username: String,
          tone: String,
          topic: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, T.anything])
      end
      def create(
        # Workflow step
        step:,
        # Extra context or URLs (refine)
        additional_context: nil,
        # Desired call to action (refine)
        call_to_action: nil,
        # Tweet draft text to evaluate (score)
        draft: nil,
        # Optimization goal
        goal: nil,
        # Whether a link is attached (score)
        has_link: nil,
        # Whether media is attached (score)
        has_media: nil,
        # Media type (refine)
        media_type: nil,
        # Cached style username for voice matching (compose)
        style_username: nil,
        # Desired tone (refine)
        tone: nil,
        # Tweet topic (compose, refine)
        topic: nil,
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
