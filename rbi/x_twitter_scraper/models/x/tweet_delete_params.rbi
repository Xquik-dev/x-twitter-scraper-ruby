# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetDeleteParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tweet_id

        # X account (@username or account ID)
        sig { returns(String) }
        attr_accessor :account

        sig do
          params(
            tweet_id: String,
            account: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tweet_id:,
          # X account (@username or account ID)
          account:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tweet_id: String,
              account: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
