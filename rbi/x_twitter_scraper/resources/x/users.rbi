# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X data lookups (subscription required)
      class Users
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Users::Follow) }
        attr_reader :follow

        # Look up X user
        sig do
          params(
            username: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::X::UserProfile)
        end
        def retrieve(
          # X username (without @)
          username,
          request_options: {}
        )
        end

        # Get multiple users by IDs
        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_batch(
          # Comma-separated user IDs (max 100)
          ids:,
          request_options: {}
        )
        end

        # Get user followers
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_followers(
          # User ID or username
          id,
          # Pagination cursor
          cursor: nil,
          # Items per page (20-200, default 200)
          page_size: nil,
          request_options: {}
        )
        end

        # Get followers you know for a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_followers_you_know(
          # User ID
          id,
          # Pagination cursor from previous response
          cursor: nil,
          request_options: {}
        )
        end

        # Get users this user follows
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_following(
          # User ID or username
          id,
          # Pagination cursor
          cursor: nil,
          # Items per page (20-200, default 200)
          page_size: nil,
          request_options: {}
        )
        end

        # Get tweets liked by a user
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
          # Pagination cursor from previous response
          cursor: nil,
          request_options: {}
        )
        end

        # Get media tweets by a user
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_media(
          # User ID
          id,
          # Pagination cursor from previous response
          cursor: nil,
          request_options: {}
        )
        end

        # Get tweets mentioning a user
        sig do
          params(
            id: String,
            cursor: String,
            since_time: String,
            until_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_mentions(
          # User ID or username
          id,
          # Pagination cursor
          cursor: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # Unix timestamp - filter before
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
          ).void
        end
        def retrieve_search(
          # Search query
          q:,
          # Pagination cursor
          cursor: nil,
          request_options: {}
        )
        end

        # Get recent tweets by a user
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
          id,
          # Pagination cursor from previous response
          cursor: nil,
          # Include parent tweet for replies
          include_parent_tweet: nil,
          # Include reply tweets
          include_replies: nil,
          request_options: {}
        )
        end

        # Get verified followers
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_verified_followers(
          # User ID or username
          id,
          # Pagination cursor
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
