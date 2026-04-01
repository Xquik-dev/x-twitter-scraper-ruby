# typed: strong

module XTwitterScraper
  module Models
    class StyleCompareResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::StyleCompareResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(XTwitterScraper::Models::StyleCompareResponse::Style1) }
      attr_reader :style1

      sig do
        params(
          style1: XTwitterScraper::Models::StyleCompareResponse::Style1::OrHash
        ).void
      end
      attr_writer :style1

      sig { returns(XTwitterScraper::Models::StyleCompareResponse::Style2) }
      attr_reader :style2

      sig do
        params(
          style2: XTwitterScraper::Models::StyleCompareResponse::Style2::OrHash
        ).void
      end
      attr_writer :style2

      sig do
        params(
          style1: XTwitterScraper::Models::StyleCompareResponse::Style1::OrHash,
          style2: XTwitterScraper::Models::StyleCompareResponse::Style2::OrHash
        ).returns(T.attached_class)
      end
      def self.new(style1:, style2:)
      end

      sig do
        override.returns(
          {
            style1: XTwitterScraper::Models::StyleCompareResponse::Style1,
            style2: XTwitterScraper::Models::StyleCompareResponse::Style2
          }
        )
      end
      def to_hash
      end

      class Style1 < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::StyleCompareResponse::Style1,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :fetched_at

        sig { returns(T::Boolean) }
        attr_accessor :is_own_account

        sig { returns(Integer) }
        attr_accessor :tweet_count

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet
            ]
          )
        end
        attr_accessor :tweets

        sig { returns(String) }
        attr_accessor :x_username

        sig do
          params(
            fetched_at: Time,
            is_own_account: T::Boolean,
            tweet_count: Integer,
            tweets:
              T::Array[
                XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet::OrHash
              ],
            x_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          fetched_at:,
          is_own_account:,
          tweet_count:,
          tweets:,
          x_username:
        )
        end

        sig do
          override.returns(
            {
              fetched_at: Time,
              is_own_account: T::Boolean,
              tweet_count: Integer,
              tweets:
                T::Array[
                  XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet
                ],
              x_username: String
            }
          )
        end
        def to_hash
        end

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::StyleCompareResponse::Style1::Tweet,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :text

          sig { returns(T.nilable(String)) }
          attr_reader :author_username

          sig { params(author_username: String).void }
          attr_writer :author_username

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          sig do
            params(
              id: String,
              text: String,
              author_username: String,
              created_at: String
            ).returns(T.attached_class)
          end
          def self.new(id:, text:, author_username: nil, created_at: nil)
          end

          sig do
            override.returns(
              {
                id: String,
                text: String,
                author_username: String,
                created_at: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class Style2 < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::StyleCompareResponse::Style2,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Time) }
        attr_accessor :fetched_at

        sig { returns(T::Boolean) }
        attr_accessor :is_own_account

        sig { returns(Integer) }
        attr_accessor :tweet_count

        sig do
          returns(
            T::Array[
              XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet
            ]
          )
        end
        attr_accessor :tweets

        sig { returns(String) }
        attr_accessor :x_username

        sig do
          params(
            fetched_at: Time,
            is_own_account: T::Boolean,
            tweet_count: Integer,
            tweets:
              T::Array[
                XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet::OrHash
              ],
            x_username: String
          ).returns(T.attached_class)
        end
        def self.new(
          fetched_at:,
          is_own_account:,
          tweet_count:,
          tweets:,
          x_username:
        )
        end

        sig do
          override.returns(
            {
              fetched_at: Time,
              is_own_account: T::Boolean,
              tweet_count: Integer,
              tweets:
                T::Array[
                  XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet
                ],
              x_username: String
            }
          )
        end
        def to_hash
        end

        class Tweet < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::StyleCompareResponse::Style2::Tweet,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :text

          sig { returns(T.nilable(String)) }
          attr_reader :author_username

          sig { params(author_username: String).void }
          attr_writer :author_username

          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          sig do
            params(
              id: String,
              text: String,
              author_username: String,
              created_at: String
            ).returns(T.attached_class)
          end
          def self.new(id:, text:, author_username: nil, created_at: nil)
          end

          sig do
            override.returns(
              {
                id: String,
                text: String,
                author_username: String,
                created_at: String
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
