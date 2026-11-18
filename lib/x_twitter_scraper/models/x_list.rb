# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class XList < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Numeric ID of the List.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name the owner gave the List.
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   About text of the List. Empty when the owner wrote none.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute member_count
      #   Accounts on the List.
      #
      #   @return [Integer, nil]
      optional :member_count, Integer, api_name: :memberCount

      # @!attribute subscriber_count
      #   Accounts that follow the List, which X calls followers.
      #
      #   @return [Integer, nil]
      optional :subscriber_count, Integer, api_name: :subscriberCount

      # @!attribute owner
      #   Public profile of the account that owns the List.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :owner, -> { XTwitterScraper::Models::UserProfile }

      # @!attribute url
      #   List page on x.com.
      #
      #   @return [String, nil]
      optional :url, String

      # @!attribute created_at
      #   When the owner made the List.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute banner_url
      #   URL of the banner the owner uploaded. Absent when the owner uploaded none.
      #
      #   @return [String, nil]
      optional :banner_url, String, api_name: :bannerUrl

      # @!attribute custom_banner
      #   Banner the owner uploaded.
      #
      #   @return [XTwitterScraper::Models::XListBanner, nil]
      optional :custom_banner, -> { XTwitterScraper::Models::XListBanner }, api_name: :customBanner

      # @!attribute default_banner
      #   Banner X shows when the owner uploaded none. It can differ between calls.
      #
      #   @return [XTwitterScraper::Models::XListBanner, nil]
      optional :default_banner, -> { XTwitterScraper::Models::XListBanner }, api_name: :defaultBanner

      # @!attribute facepile_urls
      #   Avatar URLs of a few List members, which X may pick per request.
      #
      #   @return [Array<String>, nil]
      optional :facepile_urls, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :facepileUrls

      # @!attribute members_context
      #   Member count as X words it, such as 35 members.
      #
      #   @return [String, nil]
      optional :members_context, String, api_name: :membersContext

      # @!method initialize(id:, name:, description: nil, member_count: nil, subscriber_count: nil, owner: nil, url: nil, created_at: nil, banner_url: nil, custom_banner: nil, default_banner: nil, facepile_urls: nil, members_context: nil)
      #   Public X List with its owner's public profile. It holds public fields only.
      #
      #   @param id [String] Numeric ID of the List.
      #
      #   @param name [String] Name the owner gave the List.
      #
      #   @param description [String] About text of the List. Empty when the owner wrote none.
      #
      #   @param member_count [Integer] Accounts on the List.
      #
      #   @param subscriber_count [Integer] Accounts that follow the List, which X calls followers.
      #
      #   @param owner [XTwitterScraper::Models::UserProfile] Public profile of the account that owns the List.
      #
      #   @param url [String] List page on x.com.
      #
      #   @param created_at [Time] When the owner made the List.
      #
      #   @param banner_url [String] URL of the banner the owner uploaded. Absent when the owner uploaded none.
      #
      #   @param custom_banner [XTwitterScraper::Models::XListBanner] Banner the owner uploaded.
      #
      #   @param default_banner [XTwitterScraper::Models::XListBanner] Banner X shows when the owner uploaded none. It can differ between calls.
      #
      #   @param facepile_urls [Array<String>] Avatar URLs of a few List members, which X may pick per request.
      #
      #   @param members_context [String] Member count as X words it, such as 35 members.
    end
  end
end
