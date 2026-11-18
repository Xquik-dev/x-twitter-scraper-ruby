# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Broadcast < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::Broadcast,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Broadcast ID
      sig { returns(String) }
      attr_accessor :id

      # Broadcast title
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      # Whether the broadcaster edited the title of the replay
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_title_edited

      sig { params(is_title_edited: T::Boolean).void }
      attr_writer :is_title_edited

      # State, such as NotStarted, Running or Ended, as X names it
      sig { returns(T.nilable(String)) }
      attr_reader :state

      sig { params(state: String).void }
      attr_writer :state

      # When the broadcast was set to start
      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_start

      sig { params(scheduled_start: Time).void }
      attr_writer :scheduled_start

      # When the broadcast went live
      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      # When the broadcast ended
      sig { returns(T.nilable(Time)) }
      attr_reader :ended_at

      sig { params(ended_at: Time).void }
      attr_writer :ended_at

      # When the video stream last reached X
      sig { returns(T.nilable(Time)) }
      attr_reader :last_ping_at

      sig { params(last_ping_at: Time).void }
      attr_writer :last_ping_at

      # Accounts that watched, live or after
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_watched

      sig { params(total_watched: Integer).void }
      attr_writer :total_watched

      # Accounts watching, as X counts them
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_watching

      sig { params(total_watching: Integer).void }
      attr_writer :total_watching

      # Whether X offers a recording of the broadcast
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_available_for_replay

      sig { params(is_available_for_replay: T::Boolean).void }
      attr_writer :is_available_for_replay

      # Video width in pixels
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      # Video height in pixels
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Camera rotation in degrees
      sig { returns(T.nilable(Integer)) }
      attr_reader :camera_rotation

      sig { params(camera_rotation: Integer).void }
      attr_writer :camera_rotation

      # Whether the video stream runs in high-latency mode
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_high_latency

      sig { params(is_high_latency: T::Boolean).void }
      attr_writer :is_high_latency

      # X's code for who may chat
      sig { returns(T.nilable(Integer)) }
      attr_reader :chat_option

      sig { params(chat_option: Integer).void }
      attr_writer :chat_option

      # Whether X marks the chat private
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_private_chat

      sig { params(is_private_chat: T::Boolean).void }
      attr_writer :is_private_chat

      # What produced the video stream, as X names it
      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      # X's media key for the video
      sig { returns(T.nilable(String)) }
      attr_reader :media_key

      sig { params(media_key: String).void }
      attr_writer :media_key

      # Image X shows before the broadcast starts
      sig { returns(T.nilable(String)) }
      attr_reader :pre_live_slate_url

      sig { params(pre_live_slate_url: String).void }
      attr_writer :pre_live_slate_url

      # X's revision number of the broadcast
      sig { returns(T.nilable(Integer)) }
      attr_reader :version

      sig { params(version: Integer).void }
      attr_writer :version

      # ID of the post that announces the broadcast
      sig { returns(T.nilable(String)) }
      attr_reader :tweet_id

      sig { params(tweet_id: String).void }
      attr_writer :tweet_id

      # Search tweet with author. Zero metrics may mean X omitted counts.
      sig { returns(T.nilable(XTwitterScraper::Models::SearchTweet)) }
      attr_reader :tweet

      sig { params(tweet: XTwitterScraper::Models::SearchTweet::OrHash).void }
      attr_writer :tweet

      # Broadcaster, as X's live video service names the account
      sig do
        returns(T.nilable(XTwitterScraper::Models::Broadcast::PeriscopeUser))
      end
      attr_reader :periscope_user

      sig do
        params(
          periscope_user:
            XTwitterScraper::Models::Broadcast::PeriscopeUser::OrHash
        ).void
      end
      attr_writer :periscope_user

      # Public X profile.
      sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
      attr_reader :creator

      sig { params(creator: XTwitterScraper::Models::UserProfile::OrHash).void }
      attr_writer :creator

      sig do
        params(
          id: String,
          title: String,
          is_title_edited: T::Boolean,
          state: String,
          scheduled_start: Time,
          started_at: Time,
          ended_at: Time,
          last_ping_at: Time,
          total_watched: Integer,
          total_watching: Integer,
          is_available_for_replay: T::Boolean,
          width: Integer,
          height: Integer,
          camera_rotation: Integer,
          is_high_latency: T::Boolean,
          chat_option: Integer,
          is_private_chat: T::Boolean,
          source: String,
          media_key: String,
          pre_live_slate_url: String,
          version: Integer,
          tweet_id: String,
          tweet: XTwitterScraper::Models::SearchTweet::OrHash,
          periscope_user:
            XTwitterScraper::Models::Broadcast::PeriscopeUser::OrHash,
          creator: XTwitterScraper::Models::UserProfile::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Broadcast ID
        id:,
        # Broadcast title
        title: nil,
        # Whether the broadcaster edited the title of the replay
        is_title_edited: nil,
        # State, such as NotStarted, Running or Ended, as X names it
        state: nil,
        # When the broadcast was set to start
        scheduled_start: nil,
        # When the broadcast went live
        started_at: nil,
        # When the broadcast ended
        ended_at: nil,
        # When the video stream last reached X
        last_ping_at: nil,
        # Accounts that watched, live or after
        total_watched: nil,
        # Accounts watching, as X counts them
        total_watching: nil,
        # Whether X offers a recording of the broadcast
        is_available_for_replay: nil,
        # Video width in pixels
        width: nil,
        # Video height in pixels
        height: nil,
        # Camera rotation in degrees
        camera_rotation: nil,
        # Whether the video stream runs in high-latency mode
        is_high_latency: nil,
        # X's code for who may chat
        chat_option: nil,
        # Whether X marks the chat private
        is_private_chat: nil,
        # What produced the video stream, as X names it
        source: nil,
        # X's media key for the video
        media_key: nil,
        # Image X shows before the broadcast starts
        pre_live_slate_url: nil,
        # X's revision number of the broadcast
        version: nil,
        # ID of the post that announces the broadcast
        tweet_id: nil,
        # Search tweet with author. Zero metrics may mean X omitted counts.
        tweet: nil,
        # Broadcaster, as X's live video service names the account
        periscope_user: nil,
        # Public X profile.
        creator: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            title: String,
            is_title_edited: T::Boolean,
            state: String,
            scheduled_start: Time,
            started_at: Time,
            ended_at: Time,
            last_ping_at: Time,
            total_watched: Integer,
            total_watching: Integer,
            is_available_for_replay: T::Boolean,
            width: Integer,
            height: Integer,
            camera_rotation: Integer,
            is_high_latency: T::Boolean,
            chat_option: Integer,
            is_private_chat: T::Boolean,
            source: String,
            media_key: String,
            pre_live_slate_url: String,
            version: Integer,
            tweet_id: String,
            tweet: XTwitterScraper::Models::SearchTweet,
            periscope_user: XTwitterScraper::Models::Broadcast::PeriscopeUser,
            creator: XTwitterScraper::Models::UserProfile
          }
        )
      end
      def to_hash
      end

      class PeriscopeUser < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Broadcast::PeriscopeUser,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Live video account ID
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Live video username
        sig { returns(T.nilable(String)) }
        attr_reader :username

        sig { params(username: String).void }
        attr_writer :username

        # Live video display name
        sig { returns(T.nilable(String)) }
        attr_reader :display_name

        sig { params(display_name: String).void }
        attr_writer :display_name

        # Live video avatar URL
        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture

        sig { params(profile_picture: String).void }
        attr_writer :profile_picture

        # The broadcaster's avatar at full size
        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture_original

        sig { params(profile_picture_original: String).void }
        attr_writer :profile_picture_original

        sig do
          params(
            id: String,
            username: String,
            display_name: String,
            profile_picture: String,
            profile_picture_original: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Live video account ID
          id: nil,
          # Live video username
          username: nil,
          # Live video display name
          display_name: nil,
          # Live video avatar URL
          profile_picture: nil,
          # The broadcaster's avatar at full size
          profile_picture_original: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              username: String,
              display_name: String,
              profile_picture: String,
              profile_picture_original: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
