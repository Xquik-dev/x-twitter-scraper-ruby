# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetAnalysisParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetAnalysisParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Post IDs or post URLs to analyze, up to 100.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tweet_ids

        sig { params(tweet_ids: T::Array[String]).void }
        attr_writer :tweet_ids

        # X search to analyze, with the operators of /x/tweets/search, such as
        # from:nasa or lang:en. X searches up to 512 characters, counted with the
        # other search fields, as /x/tweets/search counts q.
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        # Analyze 1 account's posts. Send a handle, with or without @, or a
        # profile URL.
        sig { returns(T.nilable(String)) }
        attr_reader :username

        sig { params(username: String).void }
        attr_writer :username

        # Analyze a public List's posts. Send its ID or URL.
        sig { returns(T.nilable(String)) }
        attr_reader :list_id

        sig { params(list_id: String).void }
        attr_writer :list_id

        # Analyze the quotes of 1 post. Send its ID or URL.
        sig { returns(T.nilable(String)) }
        attr_reader :quotes_of

        sig { params(quotes_of: String).void }
        attr_writer :quotes_of

        # Analyze the replies in 1 post's conversation. Send its ID or URL.
        sig { returns(T.nilable(String)) }
        attr_reader :replies_to

        sig { params(replies_to: String).void }
        attr_writer :replies_to

        # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix
        # seconds also work. A time without an offset is UTC.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants
            )
          )
        end
        attr_reader :since_time

        sig do
          params(
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants
          ).void
        end
        attr_writer :since_time

        # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds
        # also work. A time without an offset is UTC.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants
            )
          )
        end
        attr_reader :until_time

        sig do
          params(
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants
          ).void
        end
        attr_writer :until_time

        # Search order. Default Latest.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol
            )
          )
        end
        attr_reader :query_type

        sig do
          params(
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol
          ).void
        end
        attr_writer :query_type

        # Maximum posts to analyze from the search. A low credit balance can
        # return fewer.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # The next_cursor of the page before. Send the same search with it.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Your own texts to analyze, such as drafts. Reads nothing from X. Each
        # text costs the same as 1 analyzed post.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :texts

        sig { params(texts: T::Array[String]).void }
        attr_writer :texts

        # Keep only posts about this topic, the same as the Actors' topic input.
        # AI-powered analysis asks "Is this post about <topic>?" of each post &
        # keeps scores of 0.5 or more. Only kept posts are analyzed & cost 2
        # credits each, & a post the filter drops costs nothing. topicFilter
        # states the cutoff & counts. Send topic or imageShows, not both.
        sig { returns(T.nilable(String)) }
        attr_reader :topic

        sig { params(topic: String).void }
        attr_writer :topic

        # Keep only posts whose photos show this, the same as the Actors'
        # imageShows input. Send charts, screenshots, product_photos, memes or
        # people, or describe it in words, such as a rocket. AI-powered analysis
        # checks posts with photos X doesn't mark sensitive & keeps scores of 0.5
        # or more. Only kept posts are analyzed & cost 2 credits each. imageFilter
        # states the cutoff & counts. Send topic or imageShows, not both.
        sig { returns(T.nilable(String)) }
        attr_reader :image_shows

        sig { params(image_shows: String).void }
        attr_writer :image_shows

        # Analysis settings, the same as the analysis input of Xquik's AI Actors,
        # plus images. Leave it out for the route's own questions.
        sig do
          returns(T.nilable(XTwitterScraper::X::TweetAnalysisParams::Analysis))
        end
        attr_reader :analysis

        sig do
          params(
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash
          ).void
        end
        attr_writer :analysis

        # Rows of an earlier answer to compare with, such as its results. Each
        # needs the post's id, or tweet.id, & its answers. Send monitor too, so
        # other settings show as not_comparable. Each result's monitor says
        # whether the post is new, changed or unchanged. The comparison costs
        # nothing extra.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::X::TweetAnalysisParams::Baseline]
            )
          )
        end
        attr_reader :baseline

        sig do
          params(
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ]
          ).void
        end
        attr_writer :baseline

        # Posts to analyze & optional analysis settings. Send tweetIds, texts, or
        # a search, never more than 1. A search is query, username, listId,
        # quotesOf or repliesTo, alone or together, & sinceTime & untilTime narrow
        # it.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as
          # from:nasa or lang:en. X searches up to 512 characters, counted with
          # the other search fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a
          # profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix
          # seconds also work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix
          # seconds also work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can
          # return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each
          # text costs the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post &
          # keeps scores of 0.5 or more. Only kept posts are analyzed & cost 2
          # credits each, & a post the filter drops costs nothing. topicFilter
          # states the cutoff & counts. Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors'
          # imageShows input. Send charts, screenshots, product_photos, memes or
          # people, or describe it in words, such as a rocket. AI-powered analysis
          # checks posts with photos X doesn't mark sensitive & keeps scores of
          # 0.5 or more. Only kept posts are analyzed & cost 2 credits each.
          # imageFilter states the cutoff & counts. Send topic or imageShows, not
          # both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI
          # Actors, plus images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each
          # needs the post's id, or tweet.id, & its answers. Send monitor too, so
          # other settings show as not_comparable. Each result's monitor says
          # whether the post is new, changed or unchanged. The comparison costs
          # nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tweet_ids: T::Array[String],
              query: String,
              username: String,
              list_id: String,
              quotes_of: String,
              replies_to: String,
              since_time:
                XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
              until_time:
                XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
              query_type:
                XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
              limit: Integer,
              cursor: String,
              texts: T::Array[String],
              topic: String,
              image_shows: String,
              analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis,
              baseline:
                T::Array[XTwitterScraper::X::TweetAnalysisParams::Baseline],
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end

        module SinceTime
          extend XTwitterScraper::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Integer) }

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module UntilTime
          extend XTwitterScraper::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Integer) }

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::X::TweetAnalysisParams::QueryType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOP =
            T.let(
              :Top,
              XTwitterScraper::X::TweetAnalysisParams::QueryType::TaggedSymbol
            )
          LATEST =
            T.let(
              :Latest,
              XTwitterScraper::X::TweetAnalysisParams::QueryType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::QueryType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Analysis < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::TweetAnalysisParams::Analysis,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Your own questions, which replace the route's questions. Write
          # question IDs & category names in lower case without hyphens.
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question
                ]
              )
            )
          end
          attr_reader :questions

          sig do
            params(
              questions:
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::OrHash
                ]
            ).void
          end
          attr_writer :questions

          # A ready set of questions, used when questions is left out. complaints,
          # competitors, purchase_intent & product_feedback need targets.
          # viral_lite scores how viral the wording reads.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::OrSymbol
              )
            )
          end
          attr_reader :preset

          sig do
            params(
              preset:
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::OrSymbol
            ).void
          end
          attr_writer :preset

          # Brands, people, assets or topics the questions are about, each with
          # its aliases.
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Target
                ]
              )
            )
          end
          attr_reader :targets

          sig do
            params(
              targets:
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Target::OrHash
                ]
            ).void
          end
          attr_writer :targets

          # Background the AI reads with every post.
          sig { returns(T.nilable(String)) }
          attr_reader :context

          sig { params(context: String).void }
          attr_writer :context

          # Bytes of post, quote & settings the AI reads. Xquik cuts longer posts
          # to fit. Empty settings take 219 bytes, so a smaller value gets a 400.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_context_bytes

          sig { params(max_context_bytes: Integer).void }
          attr_writer :max_context_bytes

          # Posts analyzed at the same time.
          sig { returns(T.nilable(Integer)) }
          attr_reader :concurrency

          sig { params(concurrency: Integer).void }
          attr_writer :concurrency

          # Reads up to 4 images per post with its text, at no extra cost. Images
          # of posts X marks sensitive stay unread. Send false to analyze the text
          # alone.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :images

          sig { params(images: T::Boolean).void }
          attr_writer :images

          # Analysis settings, the same as the analysis input of Xquik's AI
          # Actors, plus images. Leave it out for the route's own questions.
          sig do
            params(
              questions:
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::OrHash
                ],
              preset:
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::OrSymbol,
              targets:
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Target::OrHash
                ],
              context: String,
              max_context_bytes: Integer,
              concurrency: Integer,
              images: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # Your own questions, which replace the route's questions. Write
            # question IDs & category names in lower case without hyphens.
            questions: nil,
            # A ready set of questions, used when questions is left out.
            # complaints, competitors, purchase_intent & product_feedback need
            # targets. viral_lite scores how viral the wording reads.
            preset: nil,
            # Brands, people, assets or topics the questions are about, each with
            # its aliases.
            targets: nil,
            # Background the AI reads with every post.
            context: nil,
            # Bytes of post, quote & settings the AI reads. Xquik cuts longer
            # posts to fit. Empty settings take 219 bytes, so a smaller value gets
            # a 400.
            max_context_bytes: nil,
            # Posts analyzed at the same time.
            concurrency: nil,
            # Reads up to 4 images per post with its text, at no extra cost.
            # Images of posts X marks sensitive stay unread. Send false to analyze
            # the text alone.
            images: nil
          )
          end

          sig do
            override.returns(
              {
                questions:
                  T::Array[
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question
                  ],
                preset:
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::OrSymbol,
                targets:
                  T::Array[
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Target
                  ],
                context: String,
                max_context_bytes: Integer,
                concurrency: Integer,
                images: T::Boolean
              }
            )
          end
          def to_hash
          end

          class Question < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Name of the answer, such as request. A name the response renames or
            # drops gets a 400, such as created_at, favorite_count, muting or
            # blocking.
            sig { returns(String) }
            attr_accessor :id

            sig do
              returns(
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::OrSymbol
              )
            end
            attr_accessor :type

            # Your version of the question, such as 1.
            sig { returns(String) }
            attr_accessor :version

            # The question, as the AI reads it.
            sig { returns(String) }
            attr_accessor :instructions

            # For a choice. Each category name with its description, or null.
            sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
            attr_reader :categories

            sig { params(categories: T::Hash[Symbol, T.nilable(String)]).void }
            attr_writer :categories

            # For a score. Each level's description, lowest first.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :levels

            sig { params(levels: T::Array[String]).void }
            attr_writer :levels

            # For a probability. What counts as yes & as no.
            sig do
              returns(
                T.nilable(
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria
                )
              )
            end
            attr_reader :criteria

            sig do
              params(
                criteria:
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria::OrHash
              ).void
            end
            attr_writer :criteria

            # A question the AI answers for each post. A choice picks 1 of 2 to
            # 255 categories, a score picks 1 of 2 or more ordered levels & a
            # probability answers yes or no.
            sig do
              params(
                id: String,
                type:
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::OrSymbol,
                version: String,
                instructions: String,
                categories: T::Hash[Symbol, T.nilable(String)],
                levels: T::Array[String],
                criteria:
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Name of the answer, such as request. A name the response renames
              # or drops gets a 400, such as created_at, favorite_count, muting or
              # blocking.
              id:,
              type:,
              # Your version of the question, such as 1.
              version:,
              # The question, as the AI reads it.
              instructions:,
              # For a choice. Each category name with its description, or null.
              categories: nil,
              # For a score. Each level's description, lowest first.
              levels: nil,
              # For a probability. What counts as yes & as no.
              criteria: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  type:
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::OrSymbol,
                  version: String,
                  instructions: String,
                  categories: T::Hash[Symbol, T.nilable(String)],
                  levels: T::Array[String],
                  criteria:
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria
                }
              )
            end
            def to_hash
            end

            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CHOICE =
                T.let(
                  :choice,
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::TaggedSymbol
                )
              SCORE =
                T.let(
                  :score,
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::TaggedSymbol
                )
              PROBABILITY =
                T.let(
                  :probability,
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Criteria < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :yes

              sig { returns(String) }
              attr_accessor :no

              # For a probability. What counts as yes & as no.
              sig { params(yes: String, no: String).returns(T.attached_class) }
              def self.new(yes:, no:)
              end

              sig { override.returns({ yes: String, no: String }) }
              def to_hash
              end
            end
          end

          module Preset
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BRAND =
              T.let(
                :brand,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            COMPLAINTS =
              T.let(
                :complaints,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            COMPETITORS =
              T.let(
                :competitors,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            PURCHASE_INTENT =
              T.let(
                :purchase_intent,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            PRODUCT_FEEDBACK =
              T.let(
                :product_feedback,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            NEWS =
              T.let(
                :news,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            SENTIMENT =
              T.let(
                :sentiment,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            MARKET =
              T.let(
                :market,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )
            VIRAL_LITE =
              T.let(
                :viral_lite,
                XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Target < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::X::TweetAnalysisParams::Analysis::Target,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :aliases

            sig { params(aliases: T::Array[String]).void }
            attr_writer :aliases

            sig do
              params(name: String, aliases: T::Array[String]).returns(
                T.attached_class
              )
            end
            def self.new(name:, aliases: nil)
            end

            sig do
              override.returns({ name: String, aliases: T::Array[String] })
            end
            def to_hash
            end
          end
        end

        class Baseline < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::TweetAnalysisParams::Baseline,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # The earlier answers by question ID.
          sig do
            returns(
              T::Hash[
                Symbol,
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Answer::Variants
              ]
            )
          end
          attr_accessor :answers

          # Post ID, or text:1 & so on. Otherwise tweet.id counts.
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet
              )
            )
          end
          attr_reader :tweet

          sig do
            params(
              tweet:
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet::OrHash
            ).void
          end
          attr_writer :tweet

          # The earlier row's monitor, with its fingerprint.
          sig do
            returns(
              T.nilable(
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor
              )
            )
          end
          attr_reader :monitor

          sig do
            params(
              monitor:
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor::OrHash
            ).void
          end
          attr_writer :monitor

          sig do
            params(
              answers:
                T::Hash[
                  Symbol,
                  XTwitterScraper::X::TweetAnalysisParams::Baseline::Answer::Variants
                ],
              id: String,
              tweet:
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet::OrHash,
              monitor:
                XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The earlier answers by question ID.
            answers:,
            # Post ID, or text:1 & so on. Otherwise tweet.id counts.
            id: nil,
            tweet: nil,
            # The earlier row's monitor, with its fingerprint.
            monitor: nil
          )
          end

          sig do
            override.returns(
              {
                answers:
                  T::Hash[
                    Symbol,
                    XTwitterScraper::X::TweetAnalysisParams::Baseline::Answer::Variants
                  ],
                id: String,
                tweet: XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet,
                monitor:
                  XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor
              }
            )
          end
          def to_hash
          end

          module Answer
            extend XTwitterScraper::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Float) }

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::TweetAnalysisParams::Baseline::Answer::Variants
                ]
              )
            end
            def self.variants
            end
          end

          class Tweet < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { params(id: String).returns(T.attached_class) }
            def self.new(id:)
            end

            sig { override.returns({ id: String }) }
            def to_hash
            end
          end

          class Monitor < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :configuration_fingerprint

            sig { params(configuration_fingerprint: String).void }
            attr_writer :configuration_fingerprint

            # The earlier row's monitor, with its fingerprint.
            sig do
              params(configuration_fingerprint: String).returns(
                T.attached_class
              )
            end
            def self.new(configuration_fingerprint: nil)
            end

            sig { override.returns({ configuration_fingerprint: String }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
