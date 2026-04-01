# typed: strong

module XTwitterScraper
  module Models
    class DrawListResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::DrawListResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T::Array[XTwitterScraper::Models::DrawListResponse::Draw]) }
      attr_accessor :draws

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_reader :next_cursor

      sig { params(next_cursor: String).void }
      attr_writer :next_cursor

      sig do
        params(
          draws:
            T::Array[XTwitterScraper::Models::DrawListResponse::Draw::OrHash],
          has_more: T::Boolean,
          next_cursor: String
        ).returns(T.attached_class)
      end
      def self.new(draws:, has_more:, next_cursor: nil)
      end

      sig do
        override.returns(
          {
            draws: T::Array[XTwitterScraper::Models::DrawListResponse::Draw],
            has_more: T::Boolean,
            next_cursor: String
          }
        )
      end
      def to_hash
      end

      class Draw < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::DrawListResponse::Draw,
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
              tweet_url: String,
              valid_entries: Integer,
              drawn_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
