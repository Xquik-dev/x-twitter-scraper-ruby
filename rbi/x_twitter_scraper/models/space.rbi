# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class Space < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::Space,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Space ID
      sig { returns(String) }
      attr_accessor :id

      # Space title
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      # NotStarted (scheduled), Running (live), Ended, Canceled (scheduled, never
      # started) or TimedOut (closed by X, not by its host)
      sig { returns(T.nilable(String)) }
      attr_reader :state

      sig { params(state: String).void }
      attr_writer :state

      # When the Space was made
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # When the Space was set to start
      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_start

      sig { params(scheduled_start: Time).void }
      attr_writer :scheduled_start

      # When the Space went live
      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      # When the Space ended
      sig { returns(T.nilable(Time)) }
      attr_reader :ended_at

      sig { params(ended_at: Time).void }
      attr_writer :ended_at

      # When X last changed the Space
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # Accounts that listened live
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_live_listeners

      sig { params(total_live_listeners: Integer).void }
      attr_writer :total_live_listeners

      # Accounts that played the recording
      sig { returns(T.nilable(Integer)) }
      attr_reader :total_replay_watched

      sig { params(total_replay_watched: Integer).void }
      attr_writer :total_replay_watched

      # Accounts in the Space now, while it is live
      sig { returns(T.nilable(Integer)) }
      attr_reader :participant_count

      sig { params(participant_count: Integer).void }
      attr_writer :participant_count

      # Whether X offers a recording
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_available_for_replay

      sig { params(is_available_for_replay: T::Boolean).void }
      attr_writer :is_available_for_replay

      # Whether listeners may clip the Space
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_available_for_clipping

      sig { params(is_available_for_clipping: T::Boolean).void }
      attr_writer :is_available_for_clipping

      # Whether the host locked the Space
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_locked

      sig { params(is_locked: T::Boolean).void }
      attr_writer :is_locked

      # Whether only X employees may join
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_employee_only

      sig { params(is_employee_only: T::Boolean).void }
      attr_writer :is_employee_only

      # Whether X lets no more accounts join
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disallow_join

      sig { params(disallow_join: T::Boolean).void }
      attr_writer :disallow_join

      # Whether anonymous listening is off
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :no_incognito

      sig { params(no_incognito: T::Boolean).void }
      attr_writer :no_incognito

      # Audio or video kind, as X names it
      sig { returns(T.nilable(String)) }
      attr_reader :content_type

      sig { params(content_type: String).void }
      attr_writer :content_type

      # X's code for who may speak
      sig { returns(T.nilable(Integer)) }
      attr_reader :conversation_controls

      sig { params(conversation_controls: Integer).void }
      attr_writer :conversation_controls

      # Most hosts and co-hosts the Space allows
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_admin_capacity

      sig { params(max_admin_capacity: Integer).void }
      attr_writer :max_admin_capacity

      # X's media key for the Space's audio
      sig { returns(T.nilable(String)) }
      attr_reader :media_key

      sig { params(media_key: String).void }
      attr_writer :media_key

      # IDs of the accounts the host tagged
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :mentioned_user_ids

      sig { params(mentioned_user_ids: T::Array[String]).void }
      attr_writer :mentioned_user_ids

      # ID of the post that announces the Space
      sig { returns(T.nilable(String)) }
      attr_reader :tweet_id

      sig { params(tweet_id: String).void }
      attr_writer :tweet_id

      # Search tweet with author. Zero metrics may mean X omitted counts.
      sig { returns(T.nilable(XTwitterScraper::Models::SearchTweet)) }
      attr_reader :tweet

      sig { params(tweet: XTwitterScraper::Models::SearchTweet::OrHash).void }
      attr_writer :tweet

      # Public X profile.
      sig { returns(T.nilable(XTwitterScraper::Models::UserProfile)) }
      attr_reader :creator

      sig { params(creator: XTwitterScraper::Models::UserProfile::OrHash).void }
      attr_writer :creator

      # Hosts and co-hosts
      sig { returns(T::Array[XTwitterScraper::Models::SpaceParticipant]) }
      attr_reader :admins

      sig do
        params(
          admins: T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash]
        ).void
      end
      attr_writer :admins

      # Accounts X lists as speakers
      sig { returns(T::Array[XTwitterScraper::Models::SpaceParticipant]) }
      attr_reader :speakers

      sig do
        params(
          speakers: T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash]
        ).void
      end
      attr_writer :speakers

      # Accounts X lists as listeners
      sig { returns(T::Array[XTwitterScraper::Models::SpaceParticipant]) }
      attr_reader :listeners

      sig do
        params(
          listeners: T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash]
        ).void
      end
      attr_writer :listeners

      # Posts the hosts and speakers shared in the Space, in X's order. Present only
      # when X lists them.
      sig do
        returns(T.nilable(T::Array[XTwitterScraper::Models::SpaceSharing]))
      end
      attr_reader :sharings

      sig do
        params(
          sharings: T::Array[XTwitterScraper::Models::SpaceSharing::OrHash]
        ).void
      end
      attr_writer :sharings

      sig do
        params(
          id: String,
          admins: T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash],
          speakers: T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash],
          listeners:
            T::Array[XTwitterScraper::Models::SpaceParticipant::OrHash],
          title: String,
          state: String,
          created_at: Time,
          scheduled_start: Time,
          started_at: Time,
          ended_at: Time,
          updated_at: Time,
          total_live_listeners: Integer,
          total_replay_watched: Integer,
          participant_count: Integer,
          is_available_for_replay: T::Boolean,
          is_available_for_clipping: T::Boolean,
          is_locked: T::Boolean,
          is_employee_only: T::Boolean,
          disallow_join: T::Boolean,
          no_incognito: T::Boolean,
          content_type: String,
          conversation_controls: Integer,
          max_admin_capacity: Integer,
          media_key: String,
          mentioned_user_ids: T::Array[String],
          tweet_id: String,
          tweet: XTwitterScraper::Models::SearchTweet::OrHash,
          creator: XTwitterScraper::Models::UserProfile::OrHash,
          sharings: T::Array[XTwitterScraper::Models::SpaceSharing::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Space ID
        id:,
        # Hosts and co-hosts
        admins:,
        # Accounts X lists as speakers
        speakers:,
        # Accounts X lists as listeners
        listeners:,
        # Space title
        title: nil,
        # NotStarted (scheduled), Running (live), Ended, Canceled (scheduled, never
        # started) or TimedOut (closed by X, not by its host)
        state: nil,
        # When the Space was made
        created_at: nil,
        # When the Space was set to start
        scheduled_start: nil,
        # When the Space went live
        started_at: nil,
        # When the Space ended
        ended_at: nil,
        # When X last changed the Space
        updated_at: nil,
        # Accounts that listened live
        total_live_listeners: nil,
        # Accounts that played the recording
        total_replay_watched: nil,
        # Accounts in the Space now, while it is live
        participant_count: nil,
        # Whether X offers a recording
        is_available_for_replay: nil,
        # Whether listeners may clip the Space
        is_available_for_clipping: nil,
        # Whether the host locked the Space
        is_locked: nil,
        # Whether only X employees may join
        is_employee_only: nil,
        # Whether X lets no more accounts join
        disallow_join: nil,
        # Whether anonymous listening is off
        no_incognito: nil,
        # Audio or video kind, as X names it
        content_type: nil,
        # X's code for who may speak
        conversation_controls: nil,
        # Most hosts and co-hosts the Space allows
        max_admin_capacity: nil,
        # X's media key for the Space's audio
        media_key: nil,
        # IDs of the accounts the host tagged
        mentioned_user_ids: nil,
        # ID of the post that announces the Space
        tweet_id: nil,
        # Search tweet with author. Zero metrics may mean X omitted counts.
        tweet: nil,
        # Public X profile.
        creator: nil,
        # Posts the hosts and speakers shared in the Space, in X's order. Present only
        # when X lists them.
        sharings: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            title: String,
            state: String,
            created_at: Time,
            scheduled_start: Time,
            started_at: Time,
            ended_at: Time,
            updated_at: Time,
            total_live_listeners: Integer,
            total_replay_watched: Integer,
            participant_count: Integer,
            is_available_for_replay: T::Boolean,
            is_available_for_clipping: T::Boolean,
            is_locked: T::Boolean,
            is_employee_only: T::Boolean,
            disallow_join: T::Boolean,
            no_incognito: T::Boolean,
            content_type: String,
            conversation_controls: Integer,
            max_admin_capacity: Integer,
            media_key: String,
            mentioned_user_ids: T::Array[String],
            tweet_id: String,
            tweet: XTwitterScraper::Models::SearchTweet,
            creator: XTwitterScraper::Models::UserProfile,
            admins: T::Array[XTwitterScraper::Models::SpaceParticipant],
            speakers: T::Array[XTwitterScraper::Models::SpaceParticipant],
            listeners: T::Array[XTwitterScraper::Models::SpaceParticipant],
            sharings: T::Array[XTwitterScraper::Models::SpaceSharing]
          }
        )
      end
      def to_hash
      end
    end
  end
end
