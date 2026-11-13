# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # The request every route of XTwitterScraper::Resources::X::Analysis takes.
      #
      # @see XTwitterScraper::Resources::X::Analysis#sentiment
      class TweetAnalysisParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute tweet_ids
        #   Post IDs or post URLs to analyze, up to 100.
        #
        #   @return [Array<String>, nil]
        optional :tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :tweetIds

        # @!attribute query
        #   X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #   or lang:en. X searches up to 512 characters, counted with the other search
        #   fields, as /x/tweets/search counts q.
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute username
        #   Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        #   @return [String, nil]
        optional :username, String

        # @!attribute list_id
        #   Analyze a public List's posts. Send its ID or URL.
        #
        #   @return [String, nil]
        optional :list_id, String, api_name: :listId

        # @!attribute quotes_of
        #   Analyze the quotes of 1 post. Send its ID or URL.
        #
        #   @return [String, nil]
        optional :quotes_of, String, api_name: :quotesOf

        # @!attribute replies_to
        #   Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        #   @return [String, nil]
        optional :replies_to, String, api_name: :repliesTo

        # @!attribute since_time
        #   Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #   work. A time without an offset is UTC.
        #
        #   @return [String, Integer, nil]
        optional :since_time, union: -> { XTwitterScraper::X::TweetAnalysisParams::SinceTime }, api_name: :sinceTime

        # @!attribute until_time
        #   Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #   work. A time without an offset is UTC.
        #
        #   @return [String, Integer, nil]
        optional :until_time, union: -> { XTwitterScraper::X::TweetAnalysisParams::UntilTime }, api_name: :untilTime

        # @!attribute query_type
        #   Search order. Default Latest.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType, nil]
        optional :query_type,
                 enum: -> { XTwitterScraper::X::TweetAnalysisParams::QueryType },
                 api_name: :queryType

        # @!attribute limit
        #   Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute cursor
        #   The next_cursor of the page before. Send the same search with it.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute texts
        #   Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #   the same as 1 analyzed post.
        #
        #   @return [Array<String>, nil]
        optional :texts, XTwitterScraper::Internal::Type::ArrayOf[String]

        # @!attribute topic
        #   Keep only posts about this topic, the same as the Actors' topic input.
        #   AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
        #   scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
        #   post the filter drops costs nothing. topicFilter states the cutoff & counts.
        #   Send topic or imageShows, not both.
        #
        #   @return [String, nil]
        optional :topic, String

        # @!attribute image_shows
        #   Keep only posts whose photos show this, the same as the Actors' imageShows
        #   input. Send charts, screenshots, product_photos, memes or people, or describe it
        #   in words, such as a rocket. AI-powered analysis checks posts with photos X
        #   doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
        #   analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
        #   topic or imageShows, not both.
        #
        #   @return [String, nil]
        optional :image_shows, String, api_name: :imageShows

        # @!attribute analysis
        #   Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #   images. Leave it out for the route's own questions.
        #
        #   @return [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis, nil]
        optional :analysis, -> { XTwitterScraper::X::TweetAnalysisParams::Analysis }

        # @!attribute baseline
        #   Rows of an earlier answer to compare with, such as its results. Each needs the
        #   post's id, or tweet.id, & its answers. Send monitor too, so other settings show
        #   as not_comparable. Each result's monitor says whether the post is new, changed
        #   or unchanged. The comparison costs nothing extra.
        #
        #   @return [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>, nil]
        optional :baseline,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetAnalysisParams::Baseline] }

        # @!method initialize(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #   Posts to analyze & optional analysis settings. Send tweetIds, texts, or a
        #   search, never more than 1. A search is query, username, listId, quotesOf or
        #   repliesTo, alone or together, & sinceTime & untilTime narrow it.
        #
        #   @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        #   @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        #   @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        #   @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        #   @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        #   @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        #   @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        #   @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        #   @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        #   @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        #   @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        #   @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        #   @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        #   @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        #   @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        #   @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

        # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        # work. A time without an offset is UTC.
        module SinceTime
          extend XTwitterScraper::Internal::Type::Union

          variant String

          variant Integer

          # @!method self.variants
          #   @return [Array(String, Integer)]
        end

        # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        # work. A time without an offset is UTC.
        module UntilTime
          extend XTwitterScraper::Internal::Type::Union

          variant String

          variant Integer

          # @!method self.variants
          #   @return [Array(String, Integer)]
        end

        # Search order. Default Latest.
        module QueryType
          extend XTwitterScraper::Internal::Type::Enum

          LATEST = :Latest
          TOP = :Top

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Analysis < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute questions
          #   Your own questions, which replace the route's questions. Write question IDs &
          #   category names in lower case without hyphens.
          #
          #   @return [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question>, nil]
          optional :questions,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetAnalysisParams::Analysis::Question]
                   }

          # @!attribute preset
          #   A ready set of questions, used when questions is left out. complaints,
          #   competitors, purchase_intent & product_feedback need targets. viral_lite scores
          #   how viral the wording reads.
          #
          #   @return [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Preset, nil]
          optional :preset, enum: -> { XTwitterScraper::X::TweetAnalysisParams::Analysis::Preset }

          # @!attribute targets
          #   Brands, people, assets or topics the questions are about, each with its aliases.
          #
          #   @return [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Target>, nil]
          optional :targets,
                   -> {
                     XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::TweetAnalysisParams::Analysis::Target]
                   }

          # @!attribute context
          #   Background the AI reads with every post.
          #
          #   @return [String, nil]
          optional :context, String

          # @!attribute max_context_bytes
          #   Bytes of post, quote & settings the AI reads. Xquik cuts longer posts to fit.
          #   Empty settings take 219 bytes, so a smaller value gets a 400.
          #
          #   @return [Integer, nil]
          optional :max_context_bytes, Integer, api_name: :maxContextBytes

          # @!attribute concurrency
          #   Posts analyzed at the same time.
          #
          #   @return [Integer, nil]
          optional :concurrency, Integer

          # @!attribute images
          #   Reads up to 4 images per post with its text, at no extra cost. Images of posts X
          #   marks sensitive stay unread. Send false to analyze the text alone.
          #
          #   @return [Boolean, nil]
          optional :images, XTwitterScraper::Internal::Type::Boolean

          # @!method initialize(questions: nil, preset: nil, targets: nil, context: nil, max_context_bytes: nil, concurrency: nil, images: nil)
          #   Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          #   images. Leave it out for the route's own questions.
          #
          #   @param questions [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question>] Your own questions, which replace the route's questions. Write question IDs &
          #
          #   @param preset [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Preset] A ready set of questions, used when questions is left out. complaints,
          #
          #   @param targets [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Target>] Brands, people, assets or topics the questions are about, each with its aliases.
          #
          #   @param context [String] Background the AI reads with every post.
          #
          #   @param max_context_bytes [Integer] Bytes of post, quote & settings the AI reads. Xquik cuts longer posts to fit.
          #
          #   @param concurrency [Integer] Posts analyzed at the same time.
          #
          #   @param images [Boolean] Reads up to 4 images per post with its text, at no extra cost. Images of posts X

          class Question < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #   Name of the answer, such as request. A name the response renames or drops gets
            #   a 400, such as created_at, favorite_count, muting or blocking.
            #
            #   @return [String]
            required :id, String

            # @!attribute type
            #
            #   @return [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question::Type]
            required :type, enum: -> { XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Type }

            # @!attribute version
            #   Your version of the question, such as 1.
            #
            #   @return [String]
            required :version, String

            # @!attribute instructions
            #   The question, as the AI reads it.
            #
            #   @return [String]
            required :instructions, String

            # @!attribute categories
            #   For a choice. Each category name with its description, or null.
            #
            #   @return [Hash{Symbol=>String, nil}, nil]
            optional :categories, XTwitterScraper::Internal::Type::HashOf[String, nil?: true]

            # @!attribute levels
            #   For a score. Each level's description, lowest first.
            #
            #   @return [Array<String>, nil]
            optional :levels, XTwitterScraper::Internal::Type::ArrayOf[String]

            # @!attribute criteria
            #   For a probability. What counts as yes & as no.
            #
            #   @return [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question::Criteria, nil]
            optional :criteria, -> { XTwitterScraper::X::TweetAnalysisParams::Analysis::Question::Criteria }

            # @!method initialize(id:, type:, version:, instructions:, categories: nil, levels: nil, criteria: nil)
            #   A question the AI answers for each post. A choice picks 1 of 2 to 255
            #   categories, a score picks 1 of 2 or more ordered levels & a probability answers
            #   yes or no.
            #
            #   @param id [String] Name of the answer, such as request. A name the response renames or drops gets
            #
            #   @param type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question::Type]
            #
            #   @param version [String] Your version of the question, such as 1.
            #
            #   @param instructions [String] The question, as the AI reads it.
            #
            #   @param categories [Hash{Symbol=>String, nil}] For a choice. Each category name with its description, or null.
            #
            #   @param levels [Array<String>] For a score. Each level's description, lowest first.
            #
            #   @param criteria [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question::Criteria] For a probability. What counts as yes & as no.

            # @see XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question#type
            module Type
              extend XTwitterScraper::Internal::Type::Enum

              CHOICE = :choice
              SCORE = :score
              PROBABILITY = :probability

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see XTwitterScraper::Models::X::TweetAnalysisParams::Analysis::Question#criteria
            class Criteria < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute yes
              #
              #   @return [String]
              required :yes, String

              # @!attribute no
              #
              #   @return [String]
              required :no, String

              # @!method initialize(yes:, no:)
              #   For a probability. What counts as yes & as no.
              #
              #   @param yes [String]
              #   @param no [String]
            end
          end

          # A ready set of questions, used when questions is left out. complaints,
          # competitors, purchase_intent & product_feedback need targets. viral_lite scores
          # how viral the wording reads.
          #
          # @see XTwitterScraper::Models::X::TweetAnalysisParams::Analysis#preset
          module Preset
            extend XTwitterScraper::Internal::Type::Enum

            BRAND = :brand
            COMPLAINTS = :complaints
            COMPETITORS = :competitors
            PURCHASE_INTENT = :purchase_intent
            PRODUCT_FEEDBACK = :product_feedback
            NEWS = :news
            SENTIMENT = :sentiment
            MARKET = :market
            VIRAL_LITE = :viral_lite

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Target < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute aliases
            #
            #   @return [Array<String>, nil]
            optional :aliases, XTwitterScraper::Internal::Type::ArrayOf[String]

            # @!method initialize(name:, aliases: nil)
            #   @param name [String]
            #   @param aliases [Array<String>]
          end
        end

        class Baseline < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute answers
          #   The earlier answers by question ID.
          #
          #   @return [Hash{Symbol=>String, Float}]
          required :answers,
                   -> {
                     XTwitterScraper::Internal::Type::HashOf[union: XTwitterScraper::X::TweetAnalysisParams::Baseline::Answer]
                   }

          # @!attribute id
          #   Post ID, or text:1 & so on. Otherwise tweet.id counts.
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute tweet
          #
          #   @return [XTwitterScraper::Models::X::TweetAnalysisParams::Baseline::Tweet, nil]
          optional :tweet, -> { XTwitterScraper::X::TweetAnalysisParams::Baseline::Tweet }

          # @!attribute monitor
          #   The earlier row's monitor, with its fingerprint.
          #
          #   @return [XTwitterScraper::Models::X::TweetAnalysisParams::Baseline::Monitor, nil]
          optional :monitor, -> { XTwitterScraper::X::TweetAnalysisParams::Baseline::Monitor }

          # @!method initialize(answers:, id: nil, tweet: nil, monitor: nil)
          #   @param answers [Hash{Symbol=>String, Float}] The earlier answers by question ID.
          #
          #   @param id [String] Post ID, or text:1 & so on. Otherwise tweet.id counts.
          #
          #   @param tweet [XTwitterScraper::Models::X::TweetAnalysisParams::Baseline::Tweet]
          #
          #   @param monitor [XTwitterScraper::Models::X::TweetAnalysisParams::Baseline::Monitor] The earlier row's monitor, with its fingerprint.

          module Answer
            extend XTwitterScraper::Internal::Type::Union

            variant String

            variant Float

            # @!method self.variants
            #   @return [Array(String, Float)]
          end

          # @see XTwitterScraper::Models::X::TweetAnalysisParams::Baseline#tweet
          class Tweet < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!method initialize(id:)
            #   @param id [String]
          end

          # @see XTwitterScraper::Models::X::TweetAnalysisParams::Baseline#monitor
          class Monitor < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute configuration_fingerprint
            #
            #   @return [String, nil]
            optional :configuration_fingerprint, String, api_name: :configurationFingerprint

            # @!method initialize(configuration_fingerprint: nil)
            #   The earlier row's monitor, with its fingerprint.
            #
            #   @param configuration_fingerprint [String]
          end
        end
      end
    end
  end
end
