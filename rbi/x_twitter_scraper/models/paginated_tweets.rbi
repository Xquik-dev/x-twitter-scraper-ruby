# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::PaginatedTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      sig { returns(String) }
      attr_accessor :next_cursor

      sig { returns(T::Array[XTwitterScraper::SearchTweet]) }
      attr_accessor :tweets

      # Whole number from 0.
      sig { returns(T.nilable(Integer)) }
      attr_reader :filtered_count

      sig { params(filtered_count: Integer).void }
      attr_writer :filtered_count

      # The UTC time this filtered search has reached.
      sig { returns(T.nilable(Time)) }
      attr_reader :read_back_to

      sig { params(read_back_to: Time).void }
      attr_writer :read_back_to

      # What X shows beside a search's posts, the same for everyone. Present on a search
      # for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
      # card in `searchContext`.
      sig do
        returns(T.nilable(XTwitterScraper::PaginatedTweets::SearchContext))
      end
      attr_reader :search_context

      sig do
        params(
          search_context:
            XTwitterScraper::PaginatedTweets::SearchContext::OrHash
        ).void
      end
      attr_writer :search_context

      # The query that ran, when it differs from your q.
      sig { returns(T.nilable(String)) }
      attr_reader :searched_query

      sig { params(searched_query: String).void }
      attr_writer :searched_query

      # Present on a last page whose sources all read past its start time.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :window_complete

      sig { params(window_complete: T::Boolean).void }
      attr_writer :window_complete

      # No-mode search, user Tweet, user reply, and direct reply reads use automatic
      # coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
      # cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
      # filtered page can still have has_next_page true.
      sig do
        params(
          has_next_page: T::Boolean,
          next_cursor: String,
          tweets: T::Array[XTwitterScraper::SearchTweet::OrHash],
          filtered_count: Integer,
          read_back_to: Time,
          search_context:
            XTwitterScraper::PaginatedTweets::SearchContext::OrHash,
          searched_query: String,
          window_complete: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        has_next_page:,
        next_cursor:,
        tweets:,
        # Whole number from 0.
        filtered_count: nil,
        # The UTC time this filtered search has reached.
        read_back_to: nil,
        # What X shows beside a search's posts, the same for everyone. Present on a search
        # for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
        # card in `searchContext`.
        search_context: nil,
        # The query that ran, when it differs from your q.
        searched_query: nil,
        # Present on a last page whose sources all read past its start time.
        window_complete: nil
      )
      end

      sig do
        override.returns(
          {
            has_next_page: T::Boolean,
            next_cursor: String,
            tweets: T::Array[XTwitterScraper::SearchTweet],
            filtered_count: Integer,
            read_back_to: Time,
            search_context: XTwitterScraper::PaginatedTweets::SearchContext,
            searched_query: String,
            window_complete: T::Boolean
          }
        )
      end
      def to_hash
      end

      class SearchContext < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::PaginatedTweets::SearchContext,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X's card for the cashtag the search names.
        sig do
          returns(XTwitterScraper::PaginatedTweets::SearchContext::SmartTag)
        end
        attr_accessor :smart_tag

        # What X shows beside a search's posts, the same for everyone. Present on a search
        # for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
        # card in `searchContext`.
        sig do
          params(
            smart_tag:
              XTwitterScraper::PaginatedTweets::SearchContext::SmartTag::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X's card for the cashtag the search names.
          smart_tag:
        )
        end

        sig do
          override.returns(
            {
              smart_tag:
                XTwitterScraper::PaginatedTweets::SearchContext::SmartTag
            }
          )
        end
        def to_hash
        end

        class SmartTag < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::PaginatedTweets::SearchContext::SmartTag,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # The ticker X matched.
          sig { returns(String) }
          attr_accessor :id

          # Whether X lists the ticker as active.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :active

          sig { params(active: T::Boolean).void }
          attr_writer :active

          # Whether X charts the ticker with open, high, low & close prices.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :supports_ohlc

          sig { params(supports_ohlc: T::Boolean).void }
          attr_writer :supports_ohlc

          # X's card for the cashtag the search names.
          sig do
            params(
              id: String,
              active: T::Boolean,
              supports_ohlc: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # The ticker X matched.
            id:,
            # Whether X lists the ticker as active.
            active: nil,
            # Whether X charts the ticker with open, high, low & close prices.
            supports_ohlc: nil
          )
          end

          sig do
            override.returns(
              { id: String, active: T::Boolean, supports_ohlc: T::Boolean }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
