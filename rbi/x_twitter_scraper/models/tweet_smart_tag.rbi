# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetSmartTag < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::TweetSmartTag,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's ID for the SmartTag.
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(XTwitterScraper::Models::TweetSmartTag::Info)) }
      attr_reader :info

      sig do
        params(info: XTwitterScraper::Models::TweetSmartTag::Info::OrHash).void
      end
      attr_writer :info

      sig do
        params(
          id: String,
          info: XTwitterScraper::Models::TweetSmartTag::Info::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # X's ID for the SmartTag.
        id: nil,
        info: nil
      )
      end

      sig do
        override.returns(
          { id: String, info: XTwitterScraper::Models::TweetSmartTag::Info }
        )
      end
      def to_hash
      end

      class Info < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::TweetSmartTag::Info,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          returns(T.nilable(XTwitterScraper::Models::TweetSmartTag::Info::Info))
        end
        attr_reader :info

        sig do
          params(
            info: XTwitterScraper::Models::TweetSmartTag::Info::Info::OrHash
          ).void
        end
        attr_writer :info

        sig do
          params(
            info: XTwitterScraper::Models::TweetSmartTag::Info::Info::OrHash
          ).returns(T.attached_class)
        end
        def self.new(info: nil)
        end

        sig do
          override.returns(
            { info: XTwitterScraper::Models::TweetSmartTag::Info::Info }
          )
        end
        def to_hash
        end

        class Info < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::TweetSmartTag::Info::Info,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whether X marks the SmartTag active.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :active

          sig { params(active: T::Boolean).void }
          attr_writer :active

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(String)) }
          attr_reader :ticker

          sig { params(ticker: String).void }
          attr_writer :ticker

          sig do
            params(active: T::Boolean, name: String, ticker: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Whether X marks the SmartTag active.
            active: nil,
            name: nil,
            ticker: nil
          )
          end

          sig do
            override.returns(
              { active: T::Boolean, name: String, ticker: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
