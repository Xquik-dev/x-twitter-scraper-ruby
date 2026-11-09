# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Event < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Event, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      # Account monitor ID for account events, or keyword monitor ID for keyword events.
      sig { returns(String) }
      attr_accessor :monitor_id

      # Source monitor type.
      sig { returns(XTwitterScraper::Event::MonitorType::TaggedSymbol) }
      attr_accessor :monitor_type

      sig { returns(Time) }
      attr_accessor :occurred_at

      # Type of event an account, keyword or post monitor fires, as events and webhooks name it.
      sig { returns(XTwitterScraper::StreamEventType::TaggedSymbol) }
      attr_accessor :type

      # Permanent X user ID of the monitored post's author, present for post events.
      sig { returns(T.nilable(String)) }
      attr_reader :author_id

      sig { params(author_id: String).void }
      attr_writer :author_id

      # Username of the monitored post's author, present for post events.
      sig { returns(T.nilable(String)) }
      attr_reader :author_username

      sig { params(author_username: String).void }
      attr_writer :author_username

      # Keyword monitor ID, present for keyword monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :keyword_monitor_id

      sig { params(keyword_monitor_id: String).void }
      attr_writer :keyword_monitor_id

      # Your monitor label when Xquik created the event, present when set. A rename
      # leaves the event's label unchanged.
      sig { returns(T.nilable(String)) }
      attr_reader :monitor_name

      sig { params(monitor_name: String).void }
      attr_writer :monitor_name

      # ID of the monitored post, present for post events.
      sig { returns(T.nilable(String)) }
      attr_reader :post_id

      sig { params(post_id: String).void }
      attr_writer :post_id

      # Link to the monitored post, present for post events.
      sig { returns(T.nilable(String)) }
      attr_reader :post_url

      sig { params(post_url: String).void }
      attr_writer :post_url

      # Keyword query, present for keyword monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      # Account username, present for account monitor events.
      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      # Permanent X user ID of the monitored account, present for account monitor
      # events. It stays the same after a username change.
      sig { returns(T.nilable(String)) }
      attr_reader :x_user_id

      sig { params(x_user_id: String).void }
      attr_writer :x_user_id

      # Monitor event summary with source metadata and occurrence time.
      sig do
        params(
          id: String,
          data: T::Hash[Symbol, T.anything],
          monitor_id: String,
          monitor_type: XTwitterScraper::Event::MonitorType::OrSymbol,
          occurred_at: Time,
          type: XTwitterScraper::StreamEventType::OrSymbol,
          author_id: String,
          author_username: String,
          keyword_monitor_id: String,
          monitor_name: String,
          post_id: String,
          post_url: String,
          query: String,
          username: String,
          x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        data:,
        # Account monitor ID for account events, or keyword monitor ID for keyword events.
        monitor_id:,
        # Source monitor type.
        monitor_type:,
        occurred_at:,
        # Type of event an account, keyword or post monitor fires, as events and webhooks name it.
        type:,
        # Permanent X user ID of the monitored post's author, present for post events.
        author_id: nil,
        # Username of the monitored post's author, present for post events.
        author_username: nil,
        # Keyword monitor ID, present for keyword monitor events.
        keyword_monitor_id: nil,
        # Your monitor label when Xquik created the event, present when set. A rename
        # leaves the event's label unchanged.
        monitor_name: nil,
        # ID of the monitored post, present for post events.
        post_id: nil,
        # Link to the monitored post, present for post events.
        post_url: nil,
        # Keyword query, present for keyword monitor events.
        query: nil,
        # Account username, present for account monitor events.
        username: nil,
        # Permanent X user ID of the monitored account, present for account monitor
        # events. It stays the same after a username change.
        x_user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            data: T::Hash[Symbol, T.anything],
            monitor_id: String,
            monitor_type: XTwitterScraper::Event::MonitorType::TaggedSymbol,
            occurred_at: Time,
            type: XTwitterScraper::StreamEventType::TaggedSymbol,
            author_id: String,
            author_username: String,
            keyword_monitor_id: String,
            monitor_name: String,
            post_id: String,
            post_url: String,
            query: String,
            username: String,
            x_user_id: String
          }
        )
      end
      def to_hash
      end

      # Source monitor type.
      module MonitorType
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Event::MonitorType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT =
          T.let(:account, XTwitterScraper::Event::MonitorType::TaggedSymbol)
        KEYWORD =
          T.let(:keyword, XTwitterScraper::Event::MonitorType::TaggedSymbol)
        POST = T.let(:post, XTwitterScraper::Event::MonitorType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::Event::MonitorType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
