# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ShadowbanReport < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ShadowbanReport,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Username of the account. Null for a suspended account asked for by ID.
      sig { returns(T.nilable(String)) }
      attr_accessor :username

      # ID of the account. Null for a suspended account asked for by username.
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # Whether the account is active, protected or suspended.
      sig do
        returns(XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol)
      end
      attr_reader :account

      sig do
        params(
          account: XTwitterScraper::Models::ShadowbanReport::Account::OrSymbol
        ).void
      end
      attr_writer :account

      # When the check ran.
      sig { returns(Time) }
      attr_accessor :checked_at

      # `suspended` means X suspended the account. `limited` means at least 1 check
      # failed. `clear` means search & suggestions passed with no fail. `unclear` means
      # neither of those.
      sig do
        returns(XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol)
      end
      attr_reader :overall

      sig do
        params(
          overall: XTwitterScraper::Models::ShadowbanReport::Overall::OrSymbol
        ).void
      end
      attr_writer :overall

      # The 9 checks, each with a verdict, a reason & evidence.
      sig { returns(XTwitterScraper::Models::ShadowbanReport::Checks) }
      attr_reader :checks

      sig do
        params(
          checks: XTwitterScraper::Models::ShadowbanReport::Checks::OrHash
        ).void
      end
      attr_writer :checks

      sig do
        params(
          username: T.nilable(String),
          user_id: T.nilable(String),
          account: XTwitterScraper::Models::ShadowbanReport::Account::OrSymbol,
          checked_at: Time,
          overall: XTwitterScraper::Models::ShadowbanReport::Overall::OrSymbol,
          checks: XTwitterScraper::Models::ShadowbanReport::Checks::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Username of the account. Null for a suspended account asked for by ID.
        username:,
        # ID of the account. Null for a suspended account asked for by username.
        user_id:,
        # Whether the account is active, protected or suspended.
        account:,
        # When the check ran.
        checked_at:,
        # `suspended` means X suspended the account. `limited` means at least 1 check
        # failed. `clear` means search & suggestions passed with no fail. `unclear` means
        # neither of those.
        overall:,
        # The 9 checks, each with a verdict, a reason & evidence.
        checks:
      )
      end

      sig do
        override.returns(
          {
            username: T.nilable(String),
            user_id: T.nilable(String),
            account:
              XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol,
            checked_at: Time,
            overall:
              XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol,
            checks: XTwitterScraper::Models::ShadowbanReport::Checks
          }
        )
      end
      def to_hash
      end

      # Whether the account is active, protected or suspended.
      module Account
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::ShadowbanReport::Account)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol
          )
        PROTECTED =
          T.let(
            :protected,
            XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol
          )
        SUSPENDED =
          T.let(
            :suspended,
            XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ShadowbanReport::Account::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # `suspended` means X suspended the account. `limited` means at least 1 check
      # failed. `clear` means search & suggestions passed with no fail. `unclear` means
      # neither of those.
      module Overall
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::Models::ShadowbanReport::Overall)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CLEAR =
          T.let(
            :clear,
            XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol
          )
        LIMITED =
          T.let(
            :limited,
            XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol
          )
        UNCLEAR =
          T.let(
            :unclear,
            XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol
          )
        SUSPENDED =
          T.let(
            :suspended,
            XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::ShadowbanReport::Overall::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Checks < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ShadowbanReport::Checks,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Passes an active or protected account & fails a suspended one.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Account)
        end
        attr_reader :account

        sig do
          params(
            account:
              XTwitterScraper::Models::ShadowbanReport::Checks::Account::OrHash
          ).void
        end
        attr_writer :account

        # Looks for the account's recent posts in X search, sorted by Latest. `listed`
        # passes & `missing` fails.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Search)
        end
        attr_reader :search

        sig do
          params(
            search:
              XTwitterScraper::Models::ShadowbanReport::Checks::Search::OrHash
          ).void
        end
        attr_writer :search

        # Looks for the account among the accounts X suggests for its username.
        # `suggested` passes & `not_suggested` fails.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion)
        end
        attr_reader :suggestion

        sig do
          params(
            suggestion:
              XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::OrHash
          ).void
        end
        attr_writer :suggestion

        # Opens the threads of up to 3 recent replies to other accounts. `in_thread`
        # passes. X ranks replies for each viewer, so `more_replies` can't tell.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Replies)
        end
        attr_reader :replies

        sig do
          params(
            replies:
              XTwitterScraper::Models::ShadowbanReport::Checks::Replies::OrHash
          ).void
        end
        attr_writer :replies

        # Reads the same reply threads as `replies`. `replies_show` passes when any
        # checked reply shows. X ranks replies for each viewer, so `replies_missing` can't
        # tell.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock)
        end
        attr_reader :reply_lock

        sig do
          params(
            reply_lock:
              XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::OrHash
          ).void
        end
        attr_writer :reply_lock

        # Looks for the account's posts on its profile timeline. `visible` passes &
        # `hidden` fails.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Timeline)
        end
        attr_reader :timeline

        sig do
          params(
            timeline:
              XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::OrHash
          ).void
        end
        attr_writer :timeline

        # Compares the newest 5 of the account's own posts older than 24 hours with its
        # earlier posts, by the median of likes, replies, reposts & quotes. `typical`
        # passes at 25% or more. A drop alone proves nothing, so `low` can't tell.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Engagement)
        end
        attr_reader :engagement

        sig do
          params(
            engagement:
              XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::OrHash
          ).void
        end
        attr_writer :engagement

        # Reads X's sensitive flag on the profile. `not_flagged` passes & `flagged` fails.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive)
        end
        attr_reader :sensitive

        sig do
          params(
            sensitive:
              XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::OrHash
          ).void
        end
        attr_writer :sensitive

        # Reads the countries where X withholds the account. `none` passes & `countries`
        # fails.
        sig do
          returns(XTwitterScraper::Models::ShadowbanReport::Checks::Withheld)
        end
        attr_reader :withheld

        sig do
          params(
            withheld:
              XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::OrHash
          ).void
        end
        attr_writer :withheld

        sig do
          params(
            account:
              XTwitterScraper::Models::ShadowbanReport::Checks::Account::OrHash,
            search:
              XTwitterScraper::Models::ShadowbanReport::Checks::Search::OrHash,
            suggestion:
              XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::OrHash,
            replies:
              XTwitterScraper::Models::ShadowbanReport::Checks::Replies::OrHash,
            reply_lock:
              XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::OrHash,
            timeline:
              XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::OrHash,
            engagement:
              XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::OrHash,
            sensitive:
              XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::OrHash,
            withheld:
              XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Passes an active or protected account & fails a suspended one.
          account:,
          # Looks for the account's recent posts in X search, sorted by Latest. `listed`
          # passes & `missing` fails.
          search:,
          # Looks for the account among the accounts X suggests for its username.
          # `suggested` passes & `not_suggested` fails.
          suggestion:,
          # Opens the threads of up to 3 recent replies to other accounts. `in_thread`
          # passes. X ranks replies for each viewer, so `more_replies` can't tell.
          replies:,
          # Reads the same reply threads as `replies`. `replies_show` passes when any
          # checked reply shows. X ranks replies for each viewer, so `replies_missing` can't
          # tell.
          reply_lock:,
          # Looks for the account's posts on its profile timeline. `visible` passes &
          # `hidden` fails.
          timeline:,
          # Compares the newest 5 of the account's own posts older than 24 hours with its
          # earlier posts, by the median of likes, replies, reposts & quotes. `typical`
          # passes at 25% or more. A drop alone proves nothing, so `low` can't tell.
          engagement:,
          # Reads X's sensitive flag on the profile. `not_flagged` passes & `flagged` fails.
          sensitive:,
          # Reads the countries where X withholds the account. `none` passes & `countries`
          # fails.
          withheld:
        )
        end

        sig do
          override.returns(
            {
              account:
                XTwitterScraper::Models::ShadowbanReport::Checks::Account,
              search: XTwitterScraper::Models::ShadowbanReport::Checks::Search,
              suggestion:
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion,
              replies:
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies,
              reply_lock:
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock,
              timeline:
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline,
              engagement:
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement,
              sensitive:
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive,
              withheld:
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld
            }
          )
        end
        def to_hash
        end

        class Account < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Account,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # State of the account on X.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # Where to see the account on X.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence::OrHash
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::OrSymbol,
              evidence:
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # State of the account on X.
            reason:,
            # Where to see the account on X.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol,
                evidence:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence
              }
            )
          end
          def to_hash
          end

          # State of the account on X.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Profile of the account on X.
            sig { returns(String) }
            attr_accessor :profile_url

            sig { params(profile_url: String).returns(T.attached_class) }
            def self.new(
              # Profile of the account on X.
              profile_url:
            )
            end

            sig { override.returns({ profile_url: String }) }
            def to_hash
            end
          end
        end

        class Search < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Search,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `listed` means search shows its posts & `missing` means it shows none.
          # `no_recent_posts` means the account has no recent post to look for.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # The search & the posts it looked for.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `listed` means search shows its posts & `missing` means it shows none.
            # `no_recent_posts` means the account has no recent post to look for.
            reason:,
            # The search & the posts it looked for.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `listed` means search shows its posts & `missing` means it shows none.
          # `no_recent_posts` means the account has no recent post to look for.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LISTED =
              T.let(
                :listed,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )
            MISSING =
              T.let(
                :missing,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )
            NO_RECENT_POSTS =
              T.let(
                :no_recent_posts,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # The search it ran.
            sig { returns(String) }
            attr_accessor :query

            # The same search on X, sorted by Latest.
            sig { returns(String) }
            attr_accessor :search_url

            # Up to 5 recent posts of the account.
            sig { returns(T::Array[String]) }
            attr_accessor :recent_post_ids

            # Up to 5 posts of the account that search showed.
            sig { returns(T::Array[String]) }
            attr_accessor :found_post_ids

            sig do
              params(
                query: String,
                search_url: String,
                recent_post_ids: T::Array[String],
                found_post_ids: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              # The search it ran.
              query:,
              # The same search on X, sorted by Latest.
              search_url:,
              # Up to 5 recent posts of the account.
              recent_post_ids:,
              # Up to 5 posts of the account that search showed.
              found_post_ids:
            )
            end

            sig do
              override.returns(
                {
                  query: String,
                  search_url: String,
                  recent_post_ids: T::Array[String],
                  found_post_ids: T::Array[String]
                }
              )
            end
            def to_hash
            end
          end
        end

        class Suggestion < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `suggested` means X suggests the account for its username.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # The username searched & the accounts X suggested.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `suggested` means X suggests the account for its username.
            reason:,
            # The username searched & the accounts X suggested.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `suggested` means X suggests the account for its username.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUGGESTED =
              T.let(
                :suggested,
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
              )
            NOT_SUGGESTED =
              T.let(
                :not_suggested,
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # The username it typed.
            sig { returns(String) }
            attr_accessor :query

            # Up to 10 accounts X suggested, in its order.
            sig { returns(T::Array[String]) }
            attr_accessor :suggested_usernames

            sig do
              params(
                query: String,
                suggested_usernames: T::Array[String]
              ).returns(T.attached_class)
            end
            def self.new(
              # The username it typed.
              query:,
              # Up to 10 accounts X suggested, in its order.
              suggested_usernames:
            )
            end

            sig do
              override.returns(
                { query: String, suggested_usernames: T::Array[String] }
              )
            end
            def to_hash
            end
          end
        end

        class Replies < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `more_replies` means X put a reply behind its hidden replies prompt. `not_found`
          # means no reply showed on the pages the check read.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # Each reply it opened & where it showed.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `more_replies` means X put a reply behind its hidden replies prompt. `not_found`
            # means no reply showed on the pages the check read.
            reason:,
            # Each reply it opened & where it showed.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `more_replies` means X put a reply behind its hidden replies prompt. `not_found`
          # means no reply showed on the pages the check read.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IN_THREAD =
              T.let(
                :in_thread,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            MORE_REPLIES =
              T.let(
                :more_replies,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            NO_RECENT_REPLIES =
              T.let(
                :no_recent_replies,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            NOT_FOUND =
              T.let(
                :not_found,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Up to 3 replies, newest first.
            sig do
              returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply
                ]
              )
            end
            attr_reader :replies

            sig do
              params(
                replies:
                  T::Array[
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::OrHash
                  ]
              ).void
            end
            attr_writer :replies

            sig do
              params(
                replies:
                  T::Array[
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::OrHash
                  ]
              ).returns(T.attached_class)
            end
            def self.new(
              # Up to 3 replies, newest first.
              replies:
            )
            end

            sig do
              override.returns(
                {
                  replies:
                    T::Array[
                      XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply
                    ]
                }
              )
            end
            def to_hash
            end

            class Reply < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              # ID of the reply.
              sig { returns(String) }
              attr_accessor :reply_id

              # The reply on X.
              sig { returns(String) }
              attr_accessor :reply_url

              # ID of the post it replies to.
              sig { returns(String) }
              attr_accessor :parent_id

              # The thread of that post on X.
              sig { returns(String) }
              attr_accessor :parent_url

              # `thread` means the reply shows in the thread. `more_replies` means it shows only
              # behind X's hidden replies prompt.
              sig do
                returns(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                )
              end
              attr_reader :placement

              sig do
                params(
                  placement:
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::OrSymbol
                ).void
              end
              attr_writer :placement

              sig do
                params(
                  reply_id: String,
                  reply_url: String,
                  parent_id: String,
                  parent_url: String,
                  placement:
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # ID of the reply.
                reply_id:,
                # The reply on X.
                reply_url:,
                # ID of the post it replies to.
                parent_id:,
                # The thread of that post on X.
                parent_url:,
                # `thread` means the reply shows in the thread. `more_replies` means it shows only
                # behind X's hidden replies prompt.
                placement:
              )
              end

              sig do
                override.returns(
                  {
                    reply_id: String,
                    reply_url: String,
                    parent_id: String,
                    parent_url: String,
                    placement:
                      XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # `thread` means the reply shows in the thread. `more_replies` means it shows only
              # behind X's hidden replies prompt.
              module Placement
                extend XTwitterScraper::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                THREAD =
                  T.let(
                    :thread,
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                  )
                MORE_REPLIES =
                  T.let(
                    :more_replies,
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                  )
                NOT_FOUND =
                  T.let(
                    :not_found,
                    XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class ReplyLock < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `replies_show` means X showed at least 1 checked reply. `replies_missing` means
          # it showed none on the pages read.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # How many replies it opened & how many showed.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `replies_show` means X showed at least 1 checked reply. `replies_missing` means
            # it showed none on the pages read.
            reason:,
            # How many replies it opened & how many showed.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `replies_show` means X showed at least 1 checked reply. `replies_missing` means
          # it showed none on the pages read.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REPLIES_SHOW =
              T.let(
                :replies_show,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )
            REPLIES_MISSING =
              T.let(
                :replies_missing,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )
            NO_RECENT_REPLIES =
              T.let(
                :no_recent_replies,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Replies it looked for, up to 3.
            sig { returns(Integer) }
            attr_accessor :checked_replies

            # Replies that showed in their thread.
            sig { returns(Integer) }
            attr_accessor :shown_replies

            sig do
              params(checked_replies: Integer, shown_replies: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # Replies it looked for, up to 3.
              checked_replies:,
              # Replies that showed in their thread.
              shown_replies:
            )
            end

            sig do
              override.returns(
                { checked_replies: Integer, shown_replies: Integer }
              )
            end
            def to_hash
            end
          end
        end

        class Timeline < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `visible` means the timeline shows posts. `hidden` means X counts posts but
          # shows none. `no_posts` means the account has none to show.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # The post count on the profile & the posts read.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `visible` means the timeline shows posts. `hidden` means X counts posts but
            # shows none. `no_posts` means the account has none to show.
            reason:,
            # The post count on the profile & the posts read.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `visible` means the timeline shows posts. `hidden` means X counts posts but
          # shows none. `no_posts` means the account has none to show.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VISIBLE =
              T.let(
                :visible,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )
            HIDDEN =
              T.let(
                :hidden,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )
            NO_POSTS =
              T.let(
                :no_posts,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Posts X counts on the profile.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :post_count

            # Posts the timeline read returned, up to 20.
            sig { returns(Integer) }
            attr_accessor :timeline_posts

            sig do
              params(
                post_count: T.nilable(Integer),
                timeline_posts: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Posts X counts on the profile.
              post_count:,
              # Posts the timeline read returned, up to 20.
              timeline_posts:
            )
            end

            sig do
              override.returns(
                { post_count: T.nilable(Integer), timeline_posts: Integer }
              )
            end
            def to_hash
            end
          end
        end

        class Engagement < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no
          # engagement.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # The 2 medians & how many posts each one covers.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no
            # engagement.
            reason:,
            # The 2 medians & how many posts each one covers.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no
          # engagement.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TYPICAL =
              T.let(
                :typical,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )
            LOW =
              T.let(
                :low,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )
            TOO_FEW_POSTS =
              T.let(
                :too_few_posts,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )
            PROTECTED =
              T.let(
                :protected,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Median engagement of the newest posts.
            sig { returns(Float) }
            attr_accessor :newest_median

            # Posts in the newest group, up to 5.
            sig { returns(Integer) }
            attr_accessor :newest_posts

            # Median engagement of the earlier posts.
            sig { returns(Float) }
            attr_accessor :earlier_median

            # Posts in the earlier group.
            sig { returns(Integer) }
            attr_accessor :earlier_posts

            sig do
              params(
                newest_median: Float,
                newest_posts: Integer,
                earlier_median: Float,
                earlier_posts: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Median engagement of the newest posts.
              newest_median:,
              # Posts in the newest group, up to 5.
              newest_posts:,
              # Median engagement of the earlier posts.
              earlier_median:,
              # Posts in the earlier group.
              earlier_posts:
            )
            end

            sig do
              override.returns(
                {
                  newest_median: Float,
                  newest_posts: Integer,
                  earlier_median: Float,
                  earlier_posts: Integer
                }
              )
            end
            def to_hash
            end
          end
        end

        class Sensitive < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `unknown` means X left the flag out of the profile.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # Always null, since the reason holds the answer.
          sig { returns(T.nilable(T.anything)) }
          attr_accessor :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::OrSymbol,
              evidence: T.nilable(T.anything)
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `unknown` means X left the flag out of the profile.
            reason:,
            # Always null, since the reason holds the answer.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol,
                evidence: T.nilable(T.anything)
              }
            )
          end
          def to_hash
          end

          # `unknown` means X left the flag out of the profile.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NOT_FLAGGED =
              T.let(
                :not_flagged,
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
              )
            FLAGGED =
              T.let(
                :flagged,
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
              )
            UNKNOWN =
              T.let(
                :unknown,
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Withheld < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Pass means X shows the account there, and fail means it doesn't. Unknown means
          # the check had nothing to test or X didn't answer.
          sig do
            returns(XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol)
          end
          attr_reader :verdict

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol
            ).void
          end
          attr_writer :verdict

          # `countries` means X lists at least 1 country.
          sig do
            returns(
              XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol
            )
          end
          attr_reader :reason

          sig do
            params(
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::OrSymbol
            ).void
          end
          attr_writer :reason

          # The countries X lists.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence
              )
            )
          end
          attr_reader :evidence

          sig do
            params(
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence::OrHash
                )
            ).void
          end
          attr_writer :evidence

          sig do
            params(
              verdict: XTwitterScraper::Models::ShadowbanVerdict::OrSymbol,
              reason:
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::OrSymbol,
              evidence:
                T.nilable(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Pass means X shows the account there, and fail means it doesn't. Unknown means
            # the check had nothing to test or X didn't answer.
            verdict:,
            # `countries` means X lists at least 1 country.
            reason:,
            # The countries X lists.
            evidence:
          )
          end

          sig do
            override.returns(
              {
                verdict:
                  XTwitterScraper::Models::ShadowbanVerdict::TaggedSymbol,
                reason:
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol,
                evidence:
                  T.nilable(
                    XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence
                  )
              }
            )
          end
          def to_hash
          end

          # `countries` means X lists at least 1 country.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NONE =
              T.let(
                :none,
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol
              )
            COUNTRIES =
              T.let(
                :countries,
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol
              )
            SUSPENDED =
              T.let(
                :suspended,
                XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Country codes as X gives them.
            sig { returns(T::Array[String]) }
            attr_accessor :countries

            sig do
              params(countries: T::Array[String]).returns(T.attached_class)
            end
            def self.new(
              # Country codes as X gives them.
              countries:
            )
            end

            sig { override.returns({ countries: T::Array[String] }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
