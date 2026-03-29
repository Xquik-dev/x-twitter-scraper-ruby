# typed: strong

module XTwitterScraper
  module Models
    class DrawRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawRetrieveResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(XTwitterScraper::Models::DrawRetrieveResponse::Draw) }
      attr_reader :draw

      sig do
        params(
          draw: XTwitterScraper::Models::DrawRetrieveResponse::Draw::OrHash
        ).void
      end
      attr_writer :draw

      sig do
        returns(T::Array[XTwitterScraper::Models::DrawRetrieveResponse::Winner])
      end
      attr_accessor :winners

      sig do
        params(
          draw: XTwitterScraper::Models::DrawRetrieveResponse::Draw::OrHash,
          winners:
            T::Array[
              XTwitterScraper::Models::DrawRetrieveResponse::Winner::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(draw:, winners:)
      end

      sig do
        override.returns(
          {
            draw: XTwitterScraper::Models::DrawRetrieveResponse::Draw,
            winners:
              T::Array[XTwitterScraper::Models::DrawRetrieveResponse::Winner]
          }
        )
      end
      def to_hash
      end

      class Draw < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::DrawRetrieveResponse::Draw,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :status

        sig { returns(Integer) }
        attr_accessor :total_entries

        sig { returns(String) }
        attr_accessor :tweet_author_username

        sig { returns(String) }
        attr_accessor :tweet_id

        sig { returns(Integer) }
        attr_accessor :tweet_like_count

        sig { returns(Integer) }
        attr_accessor :tweet_quote_count

        sig { returns(Integer) }
        attr_accessor :tweet_reply_count

        sig { returns(Integer) }
        attr_accessor :tweet_retweet_count

        sig { returns(String) }
        attr_accessor :tweet_text

        sig { returns(String) }
        attr_accessor :tweet_url

        sig { returns(Integer) }
        attr_accessor :valid_entries

        sig { returns(T.nilable(Time)) }
        attr_reader :drawn_at

        sig { params(drawn_at: Time).void }
        attr_writer :drawn_at

        sig do
          params(
            id: String,
            created_at: Time,
            status: String,
            total_entries: Integer,
            tweet_author_username: String,
            tweet_id: String,
            tweet_like_count: Integer,
            tweet_quote_count: Integer,
            tweet_reply_count: Integer,
            tweet_retweet_count: Integer,
            tweet_text: String,
            tweet_url: String,
            valid_entries: Integer,
            drawn_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          status:,
          total_entries:,
          tweet_author_username:,
          tweet_id:,
          tweet_like_count:,
          tweet_quote_count:,
          tweet_reply_count:,
          tweet_retweet_count:,
          tweet_text:,
          tweet_url:,
          valid_entries:,
          drawn_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              status: String,
              total_entries: Integer,
              tweet_author_username: String,
              tweet_id: String,
              tweet_like_count: Integer,
              tweet_quote_count: Integer,
              tweet_reply_count: Integer,
              tweet_retweet_count: Integer,
              tweet_text: String,
              tweet_url: String,
              valid_entries: Integer,
              drawn_at: Time
            }
          )
        end
        def to_hash
        end
      end

      class Winner < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::DrawRetrieveResponse::Winner,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :author_username

        sig { returns(T::Boolean) }
        attr_accessor :is_backup

        sig { returns(Integer) }
        attr_accessor :position

        sig { returns(String) }
        attr_accessor :tweet_id

        sig do
          params(
            author_username: String,
            is_backup: T::Boolean,
            position: Integer,
            tweet_id: String
          ).returns(T.attached_class)
        end
        def self.new(author_username:, is_backup:, position:, tweet_id:)
        end

        sig do
          override.returns(
            {
              author_username: String,
              is_backup: T::Boolean,
              position: Integer,
              tweet_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
