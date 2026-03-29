# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Bot#track_usage
    class BotTrackUsageParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute input_tokens
      #
      #   @return [Integer]
      required :input_tokens, Integer, api_name: :inputTokens

      # @!attribute output_tokens
      #
      #   @return [Integer]
      required :output_tokens, Integer, api_name: :outputTokens

      # @!attribute platform_user_id
      #
      #   @return [String]
      required :platform_user_id, String, api_name: :platformUserId

      # @!method initialize(input_tokens:, output_tokens:, platform_user_id:, request_options: {})
      #   @param input_tokens [Integer]
      #   @param output_tokens [Integer]
      #   @param platform_user_id [String]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
