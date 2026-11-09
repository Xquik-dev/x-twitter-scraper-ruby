# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TopicFilterSummary < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TopicFilterSummary,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The topic you sent.
      sig { returns(String) }
      attr_accessor :topic

      # The question asked of each post.
      sig { returns(String) }
      attr_accessor :question

      # The lowest topicScore a kept post has.
      sig { returns(Float) }
      attr_accessor :cutoff

      # Posts checked. Only kept posts are billed.
      sig { returns(Integer) }
      attr_accessor :checked

      # Posts about the topic, all returned & billed at 2 credits each.
      sig { returns(Integer) }
      attr_accessor :kept

      # Posts the check couldn't answer. They aren't billed or returned.
      sig { returns(T::Array[XTwitterScraper::TopicFilterSummary::Unchecked]) }
      attr_accessor :unchecked

      # What the topic filter asked & how many posts it kept.
      sig do
        params(
          topic: String,
          question: String,
          cutoff: Float,
          checked: Integer,
          kept: Integer,
          unchecked:
            T::Array[XTwitterScraper::TopicFilterSummary::Unchecked::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The topic you sent.
        topic:,
        # The question asked of each post.
        question:,
        # The lowest topicScore a kept post has.
        cutoff:,
        # Posts checked. Only kept posts are billed.
        checked:,
        # Posts about the topic, all returned & billed at 2 credits each.
        kept:,
        # Posts the check couldn't answer. They aren't billed or returned.
        unchecked:
      )
      end

      sig do
        override.returns(
          {
            topic: String,
            question: String,
            cutoff: Float,
            checked: Integer,
            kept: Integer,
            unchecked: T::Array[XTwitterScraper::TopicFilterSummary::Unchecked]
          }
        )
      end
      def to_hash
      end

      class Unchecked < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TopicFilterSummary::Unchecked,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :reason

        sig { params(id: String, reason: String).returns(T.attached_class) }
        def self.new(id:, reason:)
        end

        sig { override.returns({ id: String, reason: String }) }
        def to_hash
        end
      end
    end
  end
end
