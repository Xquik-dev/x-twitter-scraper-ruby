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

        # @!attribute media
        #   Array of media URLs to attach (mutually exclusive with media_ids)
        #
        #   @return [Array<String>, nil]
        optional :media, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute media_ids
        #   Array of media IDs to attach (mutually exclusive with media)
        #
        #   @return [Array<String>, nil]
        optional :media_ids, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute reply_to_tweet_id
        #
        #   @return [String, nil]
        optional :reply_to_tweet_id, String

        # @!attribute text
        #   Tweet text (optional when media is provided)
        #
        #   @return [String, nil]
        optional :text, String

        # @!method initialize(account:, attachment_url: nil, community_id: nil, is_note_tweet: nil, media: nil, media_ids: nil, reply_to_tweet_id: nil, text: nil, request_options: {})
        #   @param account [String] X account (@username or account ID)
        #
        #   @param attachment_url [String]
        #
        #   @param community_id [String]
        #
        #   @param is_note_tweet [Boolean]
        #
        #   @param media [Array<String>] Array of media URLs to attach (mutually exclusive with media_ids)
        #
        #   @param media_ids [Array<String>] Array of media IDs to attach (mutually exclusive with media)
        #
        #   @param reply_to_tweet_id [String]
        #
        #   @param text [String] Tweet text (optional when media is provided)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
