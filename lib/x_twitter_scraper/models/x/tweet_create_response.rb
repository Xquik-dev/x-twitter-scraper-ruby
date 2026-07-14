# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#create
      class TweetCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute charged
        #
        #   @return [Boolean]
        required :charged, XTwitterScraper::Internal::Type::Boolean

        # @!attribute charged_credits
        #   Credits charged for this tweet. Text-only tweets and replies cost 30 credits;
        #   attached media adds 2 credits per started MB.
        #
        #   @return [String]
        required :charged_credits, String, api_name: :chargedCredits

        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!attribute tweet_id
        #
        #   @return [String]
        required :tweet_id, String, api_name: :tweetId

        # @!attribute write_action_id
        #
        #   @return [String, nil]
        optional :write_action_id, String, api_name: :writeActionId

        # @!method initialize(charged:, charged_credits:, tweet_id:, write_action_id: nil, success: true)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::TweetCreateResponse} for more details.
        #
        #   @param charged [Boolean]
        #
        #   @param charged_credits [String] Credits charged for this tweet. Text-only tweets and replies cost 30 credits; at
        #
        #   @param tweet_id [String]
        #
        #   @param write_action_id [String]
        #
        #   @param success [Boolean, true]
      end
    end
  end
end
