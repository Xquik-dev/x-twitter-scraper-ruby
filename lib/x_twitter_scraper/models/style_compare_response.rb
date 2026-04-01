# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#compare
    class StyleCompareResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute style1
      #
      #   @return [XTwitterScraper::Models::StyleCompareResponse::Style1]
      required :style1, -> { XTwitterScraper::Models::StyleCompareResponse::Style1 }

      # @!attribute style2
      #
      #   @return [XTwitterScraper::Models::StyleCompareResponse::Style2]
      required :style2, -> { XTwitterScraper::Models::StyleCompareResponse::Style2 }

      # @!method initialize(style1:, style2:)
      #   @param style1 [XTwitterScraper::Models::StyleCompareResponse::Style1]
      #   @param style2 [XTwitterScraper::Models::StyleCompareResponse::Style2]

      # @see XTwitterScraper::Models::StyleCompareResponse#style1
      class Style1 < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute fetched_at
        #
        #   @return [Time]
        required :fetched_at, Time, api_name: :fetchedAt

        # @!attribute is_own_account
        #
        #   @return [Boolean]
        required :is_own_account, XTwitterScraper::Internal::Type::Boolean, api_name: :isOwnAccount

        # @!attribute tweet_count
        #
        #   @return [Integer]
        required :tweet_count, Integer, api_name: :tweetCount

        # @!attribute tweets
        #
        #   @return [Array<XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet>]
        required :tweets,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet] }

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!method initialize(fetched_at:, is_own_account:, tweet_count:, tweets:, x_username:)
        #   @param fetched_at [Time]
        #   @param is_own_account [Boolean]
        #   @param tweet_count [Integer]
        #   @param tweets [Array<XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet>]
        #   @param x_username [String]

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute author_username
          #
          #   @return [String, nil]
          optional :author_username, String, api_name: :authorUsername

          # @!attribute created_at
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :createdAt

          # @!method initialize(id:, text:, author_username: nil, created_at: nil)
          #   @param id [String]
          #   @param text [String]
          #   @param author_username [String]
          #   @param created_at [String]
        end
      end

      # @see XTwitterScraper::Models::StyleCompareResponse#style2
      class Style2 < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute fetched_at
        #
        #   @return [Time]
        required :fetched_at, Time, api_name: :fetchedAt

        # @!attribute is_own_account
        #
        #   @return [Boolean]
        required :is_own_account, XTwitterScraper::Internal::Type::Boolean, api_name: :isOwnAccount

        # @!attribute tweet_count
        #
        #   @return [Integer]
        required :tweet_count, Integer, api_name: :tweetCount

        # @!attribute tweets
        #
        #   @return [Array<XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet>]
        required :tweets,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet] }

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!method initialize(fetched_at:, is_own_account:, tweet_count:, tweets:, x_username:)
        #   @param fetched_at [Time]
        #   @param is_own_account [Boolean]
        #   @param tweet_count [Integer]
        #   @param tweets [Array<XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet>]
        #   @param x_username [String]

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute author_username
          #
          #   @return [String, nil]
          optional :author_username, String, api_name: :authorUsername

          # @!attribute created_at
          #
          #   @return [String, nil]
          optional :created_at, String, api_name: :createdAt

          # @!method initialize(id:, text:, author_username: nil, created_at: nil)
          #   @param id [String]
          #   @param text [String]
          #   @param author_username [String]
          #   @param created_at [String]
        end
      end
    end
  end
end
