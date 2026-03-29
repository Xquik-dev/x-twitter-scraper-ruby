# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Communities::Join) }
        attr_reader :join

        # X data lookups (subscription required)
        sig { returns(XTwitterScraper::Resources::X::Communities::Tweets) }
        attr_reader :tweets

        # Create community
        sig do
          params(
            account: String,
            name: String,
            description: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityCreateResponse)
        end
        def create(
          # X account (@username or account ID)
          account:,
          # Community name
          name:,
          # Community description
          description: nil,
          request_options: {}
        )
        end

        # Delete community
        sig do
          params(
            id: String,
            account: String,
            community_name: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityDeleteResponse)
        end
        def delete(
          # Resource ID (stringified bigint)
          id,
          # X account (@username or account ID)
          account:,
          # Community name for confirmation
          community_name:,
          request_options: {}
        )
        end

        # Get community details
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityRetrieveInfoResponse)
        end
        def retrieve_info(
          # Community ID
          id,
          request_options: {}
        )
        end

        # Get community members
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_members(
          # Community ID
          id,
          # Pagination cursor
          cursor: nil,
          request_options: {}
        )
        end

        # Get community moderators
        sig do
          params(
            id: String,
            cursor: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_moderators(
          # Community ID
          id,
          # Pagination cursor
          cursor: nil,
          request_options: {}
        )
        end

        # Search tweets across communities
        sig do
          params(
            q: String,
            cursor: String,
            query_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).void
        end
        def retrieve_search(
          # Search query
          q:,
          # Pagination cursor
          cursor: nil,
          # Sort order (Latest or Top)
          query_type: nil,
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
