# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Draws#run
    class DrawRunParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute tweet_url
      #
      #   @return [String]
      required :tweet_url, String, api_name: :tweetUrl

      # @!attribute backup_count
      #
      #   @return [Integer, nil]
      optional :backup_count, Integer, api_name: :backupCount

      # @!attribute filter_account_age_days
      #
      #   @return [Integer, nil]
      optional :filter_account_age_days, Integer, api_name: :filterAccountAgeDays

      # @!attribute filter_language
      #
      #   @return [String, nil]
      optional :filter_language, String, api_name: :filterLanguage

      # @!attribute filter_min_followers
      #
      #   @return [Integer, nil]
      optional :filter_min_followers, Integer, api_name: :filterMinFollowers

      # @!attribute must_follow_username
      #
      #   @return [String, nil]
      optional :must_follow_username, String, api_name: :mustFollowUsername

      # @!attribute must_retweet
      #
      #   @return [Boolean, nil]
      optional :must_retweet, XTwitterScraper::Internal::Type::Boolean, api_name: :mustRetweet

      # @!attribute required_hashtags
      #
      #   @return [Array<String>, nil]
      optional :required_hashtags,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :requiredHashtags

      # @!attribute required_keywords
      #
      #   @return [Array<String>, nil]
      optional :required_keywords,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :requiredKeywords

      # @!attribute required_mentions
      #
      #   @return [Array<String>, nil]
      optional :required_mentions,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :requiredMentions

      # @!attribute unique_authors_only
      #
      #   @return [Boolean, nil]
      optional :unique_authors_only, XTwitterScraper::Internal::Type::Boolean, api_name: :uniqueAuthorsOnly

      # @!attribute winner_count
      #
      #   @return [Integer, nil]
      optional :winner_count, Integer, api_name: :winnerCount

      # @!method initialize(tweet_url:, backup_count: nil, filter_account_age_days: nil, filter_language: nil, filter_min_followers: nil, must_follow_username: nil, must_retweet: nil, required_hashtags: nil, required_keywords: nil, required_mentions: nil, unique_authors_only: nil, winner_count: nil, request_options: {})
      #   @param tweet_url [String]
      #   @param backup_count [Integer]
      #   @param filter_account_age_days [Integer]
      #   @param filter_language [String]
      #   @param filter_min_followers [Integer]
      #   @param must_follow_username [String]
      #   @param must_retweet [Boolean]
      #   @param required_hashtags [Array<String>]
      #   @param required_keywords [Array<String>]
      #   @param required_mentions [Array<String>]
      #   @param unique_authors_only [Boolean]
      #   @param winner_count [Integer]
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
