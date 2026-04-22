# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Full tweet with text, engagement metrics, media, and metadata.
        sig { returns(XTwitterScraper::X::TweetDetail) }
        attr_reader :tweet

        sig { params(tweet: XTwitterScraper::X::TweetDetail::OrHash).void }
        attr_writer :tweet

        # Author of a tweet with follower count and verification status.
        sig { returns(T.nilable(XTwitterScraper::X::TweetAuthor)) }
        attr_reader :author

        sig { params(author: XTwitterScraper::X::TweetAuthor::OrHash).void }
        attr_writer :author

        sig do
          params(
            tweet: XTwitterScraper::X::TweetDetail::OrHash,
            author: XTwitterScraper::X::TweetAuthor::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Full tweet with text, engagement metrics, media, and metadata.
          tweet:,
          # Author of a tweet with follower count and verification status.
          author: nil
        )
        end

        sig do
          override.returns(
            {
              tweet: XTwitterScraper::X::TweetDetail,
              author: XTwitterScraper::X::TweetAuthor
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
