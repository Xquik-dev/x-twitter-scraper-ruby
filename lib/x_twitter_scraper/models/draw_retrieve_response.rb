# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#retrieve
    class DrawRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute draw
      #   Full giveaway draw with tweet metrics, entries, and timing.
      #
      #   @return [XTwitterScraper::Models::DrawRetrieveResponse::Draw]
      required :draw, -> { XTwitterScraper::Models::DrawRetrieveResponse::Draw }

      # @!attribute winners
      #
      #   @return [Array<XTwitterScraper::Models::DrawRetrieveResponse::Winner>]
      required :winners,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawRetrieveResponse::Winner] }

      # @!method initialize(draw:, winners:)
      #   @param draw [XTwitterScraper::Models::DrawRetrieveResponse::Draw] Full giveaway draw with tweet metrics, entries, and timing.
      #
      #   @param winners [Array<XTwitterScraper::Models::DrawRetrieveResponse::Winner>]

      # @see XTwitterScraper::Models::DrawRetrieveResponse#draw
      class Draw < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute total_entries
        #
        #   @return [Integer]
        required :total_entries, Integer, api_name: :totalEntries

        # @!attribute tweet_author_username
        #
        #   @return [String]
        required :tweet_author_username, String, api_name: :tweetAuthorUsername

        # @!attribute tweet_id
        #
        #   @return [String]
        required :tweet_id, String, api_name: :tweetId

        # @!attribute tweet_like_count
        #
        #   @return [Integer]
        required :tweet_like_count, Integer, api_name: :tweetLikeCount

        # @!attribute tweet_quote_count
        #
        #   @return [Integer]
        required :tweet_quote_count, Integer, api_name: :tweetQuoteCount

        # @!attribute tweet_reply_count
        #
        #   @return [Integer]
        required :tweet_reply_count, Integer, api_name: :tweetReplyCount

        # @!attribute tweet_retweet_count
        #
        #   @return [Integer]
        required :tweet_retweet_count, Integer, api_name: :tweetRetweetCount

        # @!attribute tweet_text
        #
        #   @return [String]
        required :tweet_text, String, api_name: :tweetText

        # @!attribute tweet_url
        #
        #   @return [String]
        required :tweet_url, String, api_name: :tweetUrl

        # @!attribute valid_entries
        #
        #   @return [Integer]
        required :valid_entries, Integer, api_name: :validEntries

        # @!attribute drawn_at
        #
        #   @return [Time, nil]
        optional :drawn_at, Time, api_name: :drawnAt

        # @!method initialize(id:, created_at:, status:, total_entries:, tweet_author_username:, tweet_id:, tweet_like_count:, tweet_quote_count:, tweet_reply_count:, tweet_retweet_count:, tweet_text:, tweet_url:, valid_entries:, drawn_at: nil)
        #   Full giveaway draw with tweet metrics, entries, and timing.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param status [String]
        #   @param total_entries [Integer]
        #   @param tweet_author_username [String]
        #   @param tweet_id [String]
        #   @param tweet_like_count [Integer]
        #   @param tweet_quote_count [Integer]
        #   @param tweet_reply_count [Integer]
        #   @param tweet_retweet_count [Integer]
        #   @param tweet_text [String]
        #   @param tweet_url [String]
        #   @param valid_entries [Integer]
        #   @param drawn_at [Time]
      end

      class Winner < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute author_username
        #
        #   @return [String]
        required :author_username, String, api_name: :authorUsername

        # @!attribute is_backup
        #
        #   @return [Boolean]
        required :is_backup, XTwitterScraper::Internal::Type::Boolean, api_name: :isBackup

        # @!attribute position
        #
        #   @return [Integer]
        required :position, Integer

        # @!attribute tweet_id
        #
        #   @return [String]
        required :tweet_id, String, api_name: :tweetId

        # @!method initialize(author_username:, is_backup:, position:, tweet_id:)
        #   Giveaway draw winner with position and backup flag.
        #
        #   @param author_username [String]
        #   @param is_backup [Boolean]
        #   @param position [Integer]
        #   @param tweet_id [String]
      end
    end
  end
end
