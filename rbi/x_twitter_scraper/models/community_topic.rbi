# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityTopic < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityTopic,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Topic ID. Pass it as topicId to /x/communities/popular.
      sig { returns(String) }
      attr_accessor :id

      # Topic name, which topic on /x/communities/popular takes
      sig { returns(String) }
      attr_accessor :name

      # Narrower topics inside this topic
      sig do
        returns(T::Array[XTwitterScraper::Models::CommunityTopic::Subtopic])
      end
      attr_reader :subtopics

      sig do
        params(
          subtopics:
            T::Array[XTwitterScraper::Models::CommunityTopic::Subtopic::OrHash]
        ).void
      end
      attr_writer :subtopics

      sig do
        params(
          id: String,
          name: String,
          subtopics:
            T::Array[XTwitterScraper::Models::CommunityTopic::Subtopic::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Topic ID. Pass it as topicId to /x/communities/popular.
        id:,
        # Topic name, which topic on /x/communities/popular takes
        name:,
        # Narrower topics inside this topic
        subtopics:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            subtopics:
              T::Array[XTwitterScraper::Models::CommunityTopic::Subtopic]
          }
        )
      end
      def to_hash
      end

      class Subtopic < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityTopic::Subtopic,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Subtopic ID, which topicId also takes
        sig { returns(String) }
        attr_accessor :id

        # Subtopic name, which topic also takes
        sig { returns(String) }
        attr_accessor :name

        sig { params(id: String, name: String).returns(T.attached_class) }
        def self.new(
          # Subtopic ID, which topicId also takes
          id:,
          # Subtopic name, which topic also takes
          name:
        )
        end

        sig { override.returns({ id: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
