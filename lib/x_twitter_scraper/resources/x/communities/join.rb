# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        class Join
          # Join community
          #
          # @overload create(id, account:, request_options: {})
          #
          # @param id [String] Resource ID (stringified bigint)
          #
          # @param account [String] X account (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::CommunityActionResult]
          #
          # @see XTwitterScraper::Models::X::Communities::JoinCreateParams
          def create(id, params)
            parsed, options = XTwitterScraper::X::Communities::JoinCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["x/communities/%1$s/join", id],
              body: parsed,
              model: XTwitterScraper::X::CommunityActionResult,
              options: options
            )
          end

          # Leave community
          #
          # @overload delete_all(id, account:, request_options: {})
          #
          # @param id [String] Resource ID (stringified bigint)
          #
          # @param account [String] X account (@username or account ID)
          #
          # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [XTwitterScraper::Models::X::CommunityActionResult]
          #
          # @see XTwitterScraper::Models::X::Communities::JoinDeleteAllParams
          def delete_all(id, params)
            parsed, options = XTwitterScraper::X::Communities::JoinDeleteAllParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["x/communities/%1$s/join", id],
              body: parsed,
              model: XTwitterScraper::X::CommunityActionResult,
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
