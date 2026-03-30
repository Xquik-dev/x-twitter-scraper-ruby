# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # X write actions (tweets, likes, follows, DMs)
      class Profile
        # Update X profile
        #
        # @overload update(account:, description: nil, location: nil, name: nil, url: nil, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param description [String] Bio description
        #
        # @param location [String]
        #
        # @param name [String] Display name
        #
        # @param url [String] Website URL
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateParams
        def update(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: "x/profile",
            body: parsed,
            model: XTwitterScraper::Models::X::ProfileUpdateResponse,
            options: options
          )
        end

        # Update profile avatar
        #
        # @overload update_avatar(account:, file:, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Avatar image (max 716KB)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateAvatarResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateAvatarParams
        def update_avatar(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateAvatarParams.dump_request(params)
          @client.request(
            method: :patch,
            path: "x/profile/avatar",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: XTwitterScraper::Models::X::ProfileUpdateAvatarResponse,
            options: options
          )
        end

        # Update profile banner
        #
        # @overload update_banner(account:, file:, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Banner image (max 2MB)
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::ProfileUpdateBannerResponse]
        #
        # @see XTwitterScraper::Models::X::ProfileUpdateBannerParams
        def update_banner(params)
          parsed, options = XTwitterScraper::X::ProfileUpdateBannerParams.dump_request(params)
          @client.request(
            method: :patch,
            path: "x/profile/banner",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: XTwitterScraper::Models::X::ProfileUpdateBannerResponse,
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
