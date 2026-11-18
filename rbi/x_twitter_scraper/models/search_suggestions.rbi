# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SearchSuggestions < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SearchSuggestions,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The query you sent, trimmed.
      sig { returns(String) }
      attr_accessor :query

      # Suggested accounts.
      sig { returns(T::Array[XTwitterScraper::Models::SearchSuggestionUser]) }
      attr_reader :users

      sig do
        params(
          users: T::Array[XTwitterScraper::Models::SearchSuggestionUser::OrHash]
        ).void
      end
      attr_writer :users

      # Suggested search phrases that are not hashtags.
      sig { returns(T::Array[XTwitterScraper::Models::SearchSuggestionTopic]) }
      attr_reader :topics

      sig do
        params(
          topics:
            T::Array[XTwitterScraper::Models::SearchSuggestionTopic::OrHash]
        ).void
      end
      attr_writer :topics

      # Suggested hashtags.
      sig do
        returns(T::Array[XTwitterScraper::Models::SearchSuggestionHashtag])
      end
      attr_reader :hashtags

      sig do
        params(
          hashtags:
            T::Array[XTwitterScraper::Models::SearchSuggestionHashtag::OrHash]
        ).void
      end
      attr_writer :hashtags

      # Suggested stocks & crypto tokens.
      sig do
        returns(T::Array[XTwitterScraper::Models::SearchSuggestionCashtag])
      end
      attr_reader :cashtags

      sig do
        params(
          cashtags:
            T::Array[XTwitterScraper::Models::SearchSuggestionCashtag::OrHash]
        ).void
      end
      attr_writer :cashtags

      # Suggestions returned across all 4 lists. Each costs 1 credit.
      sig { returns(Integer) }
      attr_accessor :count

      sig do
        params(
          query: String,
          users:
            T::Array[XTwitterScraper::Models::SearchSuggestionUser::OrHash],
          topics:
            T::Array[XTwitterScraper::Models::SearchSuggestionTopic::OrHash],
          hashtags:
            T::Array[XTwitterScraper::Models::SearchSuggestionHashtag::OrHash],
          cashtags:
            T::Array[XTwitterScraper::Models::SearchSuggestionCashtag::OrHash],
          count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The query you sent, trimmed.
        query:,
        # Suggested accounts.
        users:,
        # Suggested search phrases that are not hashtags.
        topics:,
        # Suggested hashtags.
        hashtags:,
        # Suggested stocks & crypto tokens.
        cashtags:,
        # Suggestions returned across all 4 lists. Each costs 1 credit.
        count:
      )
      end

      sig do
        override.returns(
          {
            query: String,
            users: T::Array[XTwitterScraper::Models::SearchSuggestionUser],
            topics: T::Array[XTwitterScraper::Models::SearchSuggestionTopic],
            hashtags:
              T::Array[XTwitterScraper::Models::SearchSuggestionHashtag],
            cashtags:
              T::Array[XTwitterScraper::Models::SearchSuggestionCashtag],
            count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
