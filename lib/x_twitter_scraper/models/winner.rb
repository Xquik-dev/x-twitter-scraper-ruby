# frozen_string_literal: true

module XTwitterScraper
  module Models
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
