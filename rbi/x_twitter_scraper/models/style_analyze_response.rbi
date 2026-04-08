# typed: strong

module XTwitterScraper
  module Models
    class StyleAnalyzeResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::StyleAnalyzeResponse,
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
        returns(T::Array[XTwitterScraper::Models::StyleAnalyzeResponse::Tweet])
      end
      attr_accessor :tweets

      sig { returns(String) }
      attr_accessor :x_username

      # Full style profile with sampled tweets used for tone analysis.
      sig do
        params(
          fetched_at: Time,
          is_own_account: T::Boolean,
          tweet_count: Integer,
          tweets:
            T::Array[
              XTwitterScraper::Models::StyleAnalyzeResponse::Tweet::OrHash
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
              T::Array[XTwitterScraper::Models::StyleAnalyzeResponse::Tweet],
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
              XTwitterScraper::Models::StyleAnalyzeResponse::Tweet,
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
