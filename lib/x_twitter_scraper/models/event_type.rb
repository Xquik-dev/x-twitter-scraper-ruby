# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Type of monitor event fired when account activity occurs.
    module EventType
      extend XTwitterScraper::Internal::Type::Enum

      TWEET_NEW = :"tweet.new"
      TWEET_REPLY = :"tweet.reply"
      TWEET_RETWEET = :"tweet.retweet"
      TWEET_QUOTE = :"tweet.quote"
      FOLLOWER_GAINED = :"follower.gained"
      FOLLOWER_LOST = :"follower.lost"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
