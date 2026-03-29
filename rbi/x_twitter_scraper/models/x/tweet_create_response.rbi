# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig { returns(String) }
        attr_accessor :tweet_id

        sig do
          params(tweet_id: String, success: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(tweet_id:, success: true)
        end

        sig { override.returns({ success: T::Boolean, tweet_id: String }) }
        def to_hash
        end
      end
    end
  end
end
