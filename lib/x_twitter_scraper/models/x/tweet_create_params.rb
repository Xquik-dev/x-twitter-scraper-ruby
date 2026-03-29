# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#create
      class TweetCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or account ID)
        #
        #   @return [String]
        required :account, String

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute attachment_url
        #
        #   @return [String, nil]
        optional :attachment_url, String

        # @!attribute community_id
        #
        #   @return [String, nil]
        optional :community_id, String

        # @!attribute is_note_tweet
        #
        #   @return [Boolean, nil]
        optional :is_note_tweet, XTwitterScraper::Internal::Type::Boolean

        # @!attribute media_ids
        #
        #   @return [Array<String>, nil]
        optional :media_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute reply_to_tweet_id
        #
        #   @return [String, nil]
        optional :reply_to_tweet_id, String

        # @!method initialize(account:, text:, attachment_url: nil, community_id: nil, is_note_tweet: nil, media_ids: nil, reply_to_tweet_id: nil, request_options: {})
        #   @param account [String] X account (@username or account ID)
        #
        #   @param text [String]
        #
        #   @param attachment_url [String]
        #
        #   @param community_id [String]
        #
        #   @param is_note_tweet [Boolean]
        #
        #   @param media_ids [Array<String>]
        #
        #   @param reply_to_tweet_id [String]
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
