# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        class Follow
          # Follow user
          #
          # @overload create(id, account:, request_options: {})
          #
          # @param id [String] User ID to follow
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Users::FollowCreateResponse]
          #
          # @see XTwitterScraper::Models::X::Users::FollowCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Users::FollowCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["x/users/%1$s/follow", id],
              body: parsed,
              model: XTwitterScraper::Models::X::Users::FollowCreateResponse,
              options: options
            )
          end

          # Unfollow user
          #
          # @overload delete_all(id, account:, request_options: {})
          #
          # @param id [String] User ID to unfollow
          #
          # @param account [String] X account identifier (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::Users::FollowDeleteAllResponse]
          #
          # @see XTwitterScraper::Models::X::Users::FollowDeleteAllParams
          def delete_all(id, params)
            parsed, options = XTwitterScraper::X::Users::FollowDeleteAllParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["x/users/%1$s/follow", id],
              body: parsed,
              model: XTwitterScraper::Models::X::Users::FollowDeleteAllResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [XTwitterScraper::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
