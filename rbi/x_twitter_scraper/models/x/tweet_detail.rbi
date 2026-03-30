# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetDetail < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetDetail,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :bookmark_count

        sig { returns(Integer) }
        attr_accessor :like_count

        sig { returns(Integer) }
        attr_accessor :quote_count

        sig { returns(Integer) }
        attr_accessor :reply_count

        sig { returns(Integer) }
        attr_accessor :retweet_count

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Integer) }
        attr_accessor :view_count

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig do
          params(
            id: String,
            bookmark_count: Integer,
            like_count: Integer,
            quote_count: Integer,
            reply_count: Integer,
            retweet_count: Integer,
            text: String,
            view_count: Integer,
            created_at: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          bookmark_count:,
          like_count:,
          quote_count:,
          reply_count:,
          retweet_count:,
          text:,
          view_count:,
          created_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              bookmark_count: Integer,
              like_count: Integer,
              quote_count: Integer,
              reply_count: Integer,
              retweet_count: Integer,
              text: String,
              view_count: Integer,
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
