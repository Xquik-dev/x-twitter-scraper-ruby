# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#run
    class DrawRunResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute total_entries
      #
      #   @return [Integer]
      required :total_entries, Integer, api_name: :totalEntries

      # @!attribute tweet_id
      #
      #   @return [String]
      required :tweet_id, String, api_name: :tweetId

      # @!attribute valid_entries
      #
      #   @return [Integer]
      required :valid_entries, Integer, api_name: :validEntries

      # @!attribute winners
      #
      #   @return [Array<XTwitterScraper::Models::DrawRunResponse::Winner>]
      required :winners,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::DrawRunResponse::Winner] }

      # @!method initialize(id:, total_entries:, tweet_id:, valid_entries:, winners:)
      #   @param id [String]
      #   @param total_entries [Integer]
      #   @param tweet_id [String]
      #   @param valid_entries [Integer]
      #   @param winners [Array<XTwitterScraper::Models::DrawRunResponse::Winner>]

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
