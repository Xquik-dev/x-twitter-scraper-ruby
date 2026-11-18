# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SportsGamePosts < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SportsGamePosts,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Whole number from 0.
      sig { returns(T.nilable(Integer)) }
      attr_reader :filtered_count

      sig { params(filtered_count: Integer).void }
      attr_writer :filtered_count

      sig { returns(T::Array[XTwitterScraper::Models::SearchTweet]) }
      attr_reader :tweets

      sig do
        params(
          tweets: T::Array[XTwitterScraper::Models::SearchTweet::OrHash]
        ).void
      end
      attr_writer :tweets

      sig { returns(T::Boolean) }
      attr_accessor :has_next_page

      # Cursor for the next page. Send it unchanged. Each next page arrives fast.
      sig { returns(String) }
      attr_accessor :next_cursor

      # Present on a last page that X cut short. `stalled` means X returned no new
      # results 2 times in a row, 30 s apart. The list may hold more. Read it again
      # later without cursor.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::CoverageEndReason::TaggedSymbol)
        )
      end
      attr_reader :end_reason

      sig do
        params(
          end_reason: XTwitterScraper::Models::CoverageEndReason::OrSymbol
        ).void
      end
      attr_writer :end_reason

      # The UTC time this filtered search has reached.
      sig { returns(T.nilable(Time)) }
      attr_reader :read_back_to

      sig { params(read_back_to: Time).void }
      attr_writer :read_back_to

      # Present on a last page whose sources all read past its start time.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :window_complete

      sig { params(window_complete: T::Boolean).void }
      attr_writer :window_complete

      # Present on an empty last page when X shows this account's timeline to nobody.
      # The page is empty because of that, so it doesn't mean the account posted
      # nothing. A retry returns the same page.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :hidden_timeline

      sig { params(hidden_timeline: T::Boolean).void }
      attr_writer :hidden_timeline

      # The query that ran, when it differs from your q.
      sig { returns(T.nilable(String)) }
      attr_reader :searched_query

      sig { params(searched_query: String).void }
      attr_writer :searched_query

      # What X shows beside a search's posts, the same for everyone. Present on a search
      # for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
      # card in `searchContext`.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::SportsGamePosts::SearchContext)
        )
      end
      attr_reader :search_context

      sig do
        params(
          search_context:
            XTwitterScraper::Models::SportsGamePosts::SearchContext::OrHash
        ).void
      end
      attr_writer :search_context

      # An X search for this game's posts, in the order asked. Send it to GET
      # /x/tweets/search for more filters. Null when no search is available.
      sig { returns(T.nilable(String)) }
      attr_accessor :query

      sig do
        params(
          tweets: T::Array[XTwitterScraper::Models::SearchTweet::OrHash],
          has_next_page: T::Boolean,
          next_cursor: String,
          query: T.nilable(String),
          filtered_count: Integer,
          end_reason: XTwitterScraper::Models::CoverageEndReason::OrSymbol,
          read_back_to: Time,
          window_complete: T::Boolean,
          hidden_timeline: T::Boolean,
          searched_query: String,
          search_context:
            XTwitterScraper::Models::SportsGamePosts::SearchContext::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        tweets:,
        has_next_page:,
        # Cursor for the next page. Send it unchanged. Each next page arrives fast.
        next_cursor:,
        # An X search for this game's posts, in the order asked. Send it to GET
        # /x/tweets/search for more filters. Null when no search is available.
        query:,
        # Whole number from 0.
        filtered_count: nil,
        # Present on a last page that X cut short. `stalled` means X returned no new
        # results 2 times in a row, 30 s apart. The list may hold more. Read it again
        # later without cursor.
        end_reason: nil,
        # The UTC time this filtered search has reached.
        read_back_to: nil,
        # Present on a last page whose sources all read past its start time.
        window_complete: nil,
        # Present on an empty last page when X shows this account's timeline to nobody.
        # The page is empty because of that, so it doesn't mean the account posted
        # nothing. A retry returns the same page.
        hidden_timeline: nil,
        # The query that ran, when it differs from your q.
        searched_query: nil,
        # What X shows beside a search's posts, the same for everyone. Present on a search
        # for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
        # card in `searchContext`.
        search_context: nil
      )
      end

      sig do
        override.returns(
          {
            filtered_count: Integer,
            tweets: T::Array[XTwitterScraper::Models::SearchTweet],
            has_next_page: T::Boolean,
            next_cursor: String,
            end_reason:
              XTwitterScraper::Models::CoverageEndReason::TaggedSymbol,
            read_back_to: Time,
            window_complete: T::Boolean,
            hidden_timeline: T::Boolean,
            searched_query: String,
            search_context:
              XTwitterScraper::Models::SportsGamePosts::SearchContext,
            query: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class SearchContext < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SportsGamePosts::SearchContext,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X's card for the cashtag the search names.
        sig do
          returns(
            XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag
          )
        end
        attr_reader :smart_tag

        sig do
          params(
            smart_tag:
              XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag::OrHash
          ).void
        end
        attr_writer :smart_tag

        sig do
          params(
            smart_tag:
              XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag::OrHash
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
                XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag
            }
          )
        end
        def to_hash
        end

        class SmartTag < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag,
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
