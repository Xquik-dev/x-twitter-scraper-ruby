# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Look up, search, and explore user profiles and relationships
      class Users
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Users::Follow) }
        attr_reader :follow

        # Get user profile with follower counts & verification
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::UserProfile)
        end
        def retrieve(
          # X username (without @) or user ID
          id,
          request_options: {}
        )
        end

        # Look up multiple users by IDs in one call
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_batch(
          # Comma-separated user IDs (max 100)
          ids:,
          request_options: {}
        )
        end

        # List followers of a user
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers(
          # User ID or username
          id,
          # Pagination cursor for followers list
          cursor: nil,
          # Items per page (20-200, default 200)
          page_size: nil,
          request_options: {}
        )
        end

        # List mutual followers between you and a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers_you_know(
          # User ID for followers-you-know lookup
          id,
          # Pagination cursor for followers-you-know
          cursor: nil,
          request_options: {}
        )
        end

        # List accounts a user follows
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_following(
          # User ID or username for following lookup
          id,
          # Pagination cursor for following list
          cursor: nil,
          # Results per page (20-200, default 200)
          page_size: nil,
          request_options: {}
        )
        end

        # List tweets liked by a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_likes(
          # User ID
          id,
          # Pagination cursor for liked tweets
          cursor: nil,
          request_options: {}
        )
        end

        # List media tweets posted by a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_media(
          # User ID for media lookup
          id,
          # Pagination cursor for media tweets
          cursor: nil,
          request_options: {}
        )
        end

        # List tweets mentioning a user
        sig do
          params(
            id: String,
            cursor: String,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_mentions(
          # User ID or username for mentions lookup
          id,
          # Pagination cursor for mentions
          cursor: nil,
          # Unix timestamp - return mentions after this time
          since_time: nil,
          # Unix timestamp - return mentions before this time
          until_time: nil,
          request_options: {}
        )
        end

        # Search users by name or username
        sig do
          params(
            q: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_search(
          # User search query
          q:,
          # Pagination cursor for user search
          cursor: nil,
          request_options: {}
        )
        end

        # List recent tweets posted by a user
        sig do
          params(
            id: String,
            cursor: String,
            include_parent_tweet: T::Boolean,
            include_replies: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_tweets(
          # X user ID or username
          id,
          # Pagination cursor for user tweets
          cursor: nil,
          # Include parent tweet for replies
          include_parent_tweet: nil,
          # Include reply tweets
          include_replies: nil,
          request_options: {}
        )
        end

        # List verified followers of a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_verified_followers(
          # User ID or username for verified followers
          id,
          # Pagination cursor for verified followers
          cursor: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
