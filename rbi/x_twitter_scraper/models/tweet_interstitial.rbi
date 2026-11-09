# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetInterstitial < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TweetInterstitial,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # How x.com shows the notice. `NonCompliant` marks a post that broke X's rules.
      sig { returns(T.nilable(String)) }
      attr_reader :display_type

      sig { params(display_type: String).void }
      attr_writer :display_type

      sig { returns(T.nilable(XTwitterScraper::TweetInterstitial::Text)) }
      attr_reader :text

      sig do
        params(text: XTwitterScraper::TweetInterstitial::Text::OrHash).void
      end
      attr_writer :text

      # The notice x.com covers the post with until someone chooses to view it, such as
      # X's public interest notice on a post that broke its rules but stays up.
      sig do
        params(
          display_type: String,
          text: XTwitterScraper::TweetInterstitial::Text::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # How x.com shows the notice. `NonCompliant` marks a post that broke X's rules.
        display_type: nil,
        text: nil
      )
      end

      sig do
        override.returns(
          {
            display_type: String,
            text: XTwitterScraper::TweetInterstitial::Text
          }
        )
      end
      def to_hash
      end

      class Text < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetInterstitial::Text,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The notice's text.
        sig { returns(T.nilable(String)) }
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        # Whether X writes it right to left.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :rtl

        sig { params(rtl: T::Boolean).void }
        attr_writer :rtl

        # Links inside the notice, by character range.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::TweetInterstitial::Text::Entity]
            )
          )
        end
        attr_reader :entities

        sig do
          params(
            entities:
              T::Array[XTwitterScraper::TweetInterstitial::Text::Entity::OrHash]
          ).void
        end
        attr_writer :entities

        sig do
          params(
            text: String,
            rtl: T::Boolean,
            entities:
              T::Array[XTwitterScraper::TweetInterstitial::Text::Entity::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The notice's text.
          text: nil,
          # Whether X writes it right to left.
          rtl: nil,
          # Links inside the notice, by character range.
          entities: nil
        )
        end

        sig do
          override.returns(
            {
              text: String,
              rtl: T::Boolean,
              entities:
                T::Array[XTwitterScraper::TweetInterstitial::Text::Entity]
            }
          )
        end
        def to_hash
        end

        class Entity < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::TweetInterstitial::Text::Entity,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whole number from 0.
          sig { returns(T.nilable(Integer)) }
          attr_reader :from_index

          sig { params(from_index: Integer).void }
          attr_writer :from_index

          # Whole number from 0.
          sig { returns(T.nilable(Integer)) }
          attr_reader :to_index

          sig { params(to_index: Integer).void }
          attr_writer :to_index

          sig do
            returns(
              T.nilable(XTwitterScraper::TweetInterstitial::Text::Entity::Ref)
            )
          end
          attr_reader :ref

          sig do
            params(
              ref: XTwitterScraper::TweetInterstitial::Text::Entity::Ref::OrHash
            ).void
          end
          attr_writer :ref

          sig do
            params(
              from_index: Integer,
              to_index: Integer,
              ref: XTwitterScraper::TweetInterstitial::Text::Entity::Ref::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Whole number from 0.
            from_index: nil,
            # Whole number from 0.
            to_index: nil,
            ref: nil
          )
          end

          sig do
            override.returns(
              {
                from_index: Integer,
                to_index: Integer,
                ref: XTwitterScraper::TweetInterstitial::Text::Entity::Ref
              }
            )
          end
          def to_hash
          end

          class Ref < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::TweetInterstitial::Text::Entity::Ref,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            sig { returns(T.nilable(String)) }
            attr_reader :url_type

            sig { params(url_type: String).void }
            attr_writer :url_type

            sig { returns(T.nilable(String)) }
            attr_reader :text

            sig { params(text: String).void }
            attr_writer :text

            sig { returns(T.nilable(String)) }
            attr_reader :screen_name

            sig { params(screen_name: String).void }
            attr_writer :screen_name

            sig do
              params(
                type: String,
                url: String,
                url_type: String,
                text: String,
                screen_name: String
              ).returns(T.attached_class)
            end
            def self.new(
              type: nil,
              url: nil,
              url_type: nil,
              text: nil,
              screen_name: nil
            )
            end

            sig do
              override.returns(
                {
                  type: String,
                  url: String,
                  url_type: String,
                  text: String,
                  screen_name: String
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
