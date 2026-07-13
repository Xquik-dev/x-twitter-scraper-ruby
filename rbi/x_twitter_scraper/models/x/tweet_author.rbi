# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetAuthor < XTwitterScraper::Models::UserProfile
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetAuthor,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :followers

        sig { returns(T::Boolean) }
        attr_accessor :verified

        # Tweet author profile. The lookup route always includes follower count and
        # verification state. Other profile fields appear when available.
        sig do
          params(followers: Integer, verified: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(followers:, verified:)
        end

        sig { override.returns({ followers: Integer, verified: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
