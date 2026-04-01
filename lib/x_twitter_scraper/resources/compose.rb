# frozen_string_literal: true

module XTwitterScraper
  module Resources
    # Tweet composition, drafts, writing styles & radar
    class Compose
      # Compose, refine, or score a tweet
      #
      # @overload create(step:, additional_context: nil, call_to_action: nil, draft: nil, goal: nil, has_link: nil, has_media: nil, media_type: nil, style_username: nil, tone: nil, topic: nil, request_options: {})
      #
      # @param step [Symbol, XTwitterScraper::Models::ComposeCreateParams::Step] Workflow step
      #
      # @param additional_context [String] Extra context or URLs (refine)
      #
      # @param call_to_action [String] Desired call to action (refine)
      #
      # @param draft [String] Tweet draft text to evaluate (score)
      #
      # @param goal [Symbol, XTwitterScraper::Models::ComposeCreateParams::Goal] Optimization goal
      #
      # @param has_link [Boolean] Whether a link is attached (score)
      #
      # @param has_media [Boolean] Whether media is attached (score)
      #
      # @param media_type [Symbol, XTwitterScraper::Models::ComposeCreateParams::MediaType] Media type (refine)
      #
      # @param style_username [String] Cached style username for voice matching (compose)
      #
      # @param tone [String] Desired tone (refine)
      #
      # @param topic [String] Tweet topic (compose, refine)
      #
      # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [XTwitterScraper::Models::ComposeCreateResponse]
      #
      # @see XTwitterScraper::Models::ComposeCreateParams
      def create(params)
        parsed, options = XTwitterScraper::ComposeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "compose",
          body: parsed,
          model: XTwitterScraper::Models::ComposeCreateResponse,
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
