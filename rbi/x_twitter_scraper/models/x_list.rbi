# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XList < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XList,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Numeric ID of the List.
      sig { returns(String) }
      attr_accessor :id

      # Name the owner gave the List.
      sig { returns(String) }
      attr_accessor :name

      # About text of the List. Empty when the owner wrote none.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Accounts on the List.
      sig { returns(T.nilable(Integer)) }
      attr_reader :member_count

      sig { params(member_count: Integer).void }
      attr_writer :member_count

      # Accounts that follow the List, which X calls followers.
      sig { returns(T.nilable(Integer)) }
      attr_reader :subscriber_count

      sig { params(subscriber_count: Integer).void }
      attr_writer :subscriber_count

      # Public profile of the account that owns the List.
      sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
      attr_reader :owner

      sig { params(owner: XTwitterScraper::Models::UserProfile::OrHash).void }
      attr_writer :owner

      # List page on x.com.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # When the owner made the List.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # URL of the banner the owner uploaded. Absent when the owner uploaded none.
      sig { returns(T.nilable(String)) }
      attr_reader :banner_url

      sig { params(banner_url: String).void }
      attr_writer :banner_url

      # Banner the owner uploaded.
      sig { returns(T.nilable(XTwitterScraper::Models::XListBanner)) }
      attr_reader :custom_banner

      sig do
        params(custom_banner: XTwitterScraper::Models::XListBanner::OrHash).void
      end
      attr_writer :custom_banner

      # Banner X shows when the owner uploaded none. It can differ between calls.
      sig { returns(T.nilable(XTwitterScraper::Models::XListBanner)) }
      attr_reader :default_banner

      sig do
        params(
          default_banner: XTwitterScraper::Models::XListBanner::OrHash
        ).void
      end
      attr_writer :default_banner

      # Avatar URLs of a few List members, which X may pick per request.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :facepile_urls

      sig { params(facepile_urls: T::Array[String]).void }
      attr_writer :facepile_urls

      # Member count as X words it, such as 35 members.
      sig { returns(T.nilable(String)) }
      attr_reader :members_context

      sig { params(members_context: String).void }
      attr_writer :members_context

      sig do
        params(
          id: String,
          name: String,
          description: String,
          member_count: Integer,
          subscriber_count: Integer,
          owner: XTwitterScraper::Models::UserProfile::OrHash,
          url: String,
          created_at: Time,
          banner_url: String,
          custom_banner: XTwitterScraper::Models::XListBanner::OrHash,
          default_banner: XTwitterScraper::Models::XListBanner::OrHash,
          facepile_urls: T::Array[String],
          members_context: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Numeric ID of the List.
        id:,
        # Name the owner gave the List.
        name:,
        # About text of the List. Empty when the owner wrote none.
        description: nil,
        # Accounts on the List.
        member_count: nil,
        # Accounts that follow the List, which X calls followers.
        subscriber_count: nil,
        # Public profile of the account that owns the List.
        owner: nil,
        # List page on x.com.
        url: nil,
        # When the owner made the List.
        created_at: nil,
        # URL of the banner the owner uploaded. Absent when the owner uploaded none.
        banner_url: nil,
        # Banner the owner uploaded.
        custom_banner: nil,
        # Banner X shows when the owner uploaded none. It can differ between calls.
        default_banner: nil,
        # Avatar URLs of a few List members, which X may pick per request.
        facepile_urls: nil,
        # Member count as X words it, such as 35 members.
        members_context: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            description: String,
            member_count: Integer,
            subscriber_count: Integer,
            owner: XTwitterScraper::Models::UserProfile,
            url: String,
            created_at: Time,
            banner_url: String,
            custom_banner: XTwitterScraper::Models::XListBanner,
            default_banner: XTwitterScraper::Models::XListBanner,
            facepile_urls: T::Array[String],
            members_context: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
