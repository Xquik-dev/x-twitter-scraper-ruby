# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Space < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Space ID
      #
      #   @return [String]
      required :id, String

      # @!attribute title
      #   Space title
      #
      #   @return [String, nil]
      optional :title, String

      # @!attribute state
      #   NotStarted (scheduled), Running (live), Ended, Canceled (scheduled, never
      #   started) or TimedOut (closed by X, not by its host)
      #
      #   @return [String, nil]
      optional :state, String

      # @!attribute created_at
      #   When the Space was made
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute scheduled_start
      #   When the Space was set to start
      #
      #   @return [Time, nil]
      optional :scheduled_start, Time, api_name: :scheduledStart

      # @!attribute started_at
      #   When the Space went live
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt

      # @!attribute ended_at
      #   When the Space ended
      #
      #   @return [Time, nil]
      optional :ended_at, Time, api_name: :endedAt

      # @!attribute updated_at
      #   When X last changed the Space
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!attribute total_live_listeners
      #   Accounts that listened live
      #
      #   @return [Integer, nil]
      optional :total_live_listeners, Integer, api_name: :totalLiveListeners

      # @!attribute total_replay_watched
      #   Accounts that played the recording
      #
      #   @return [Integer, nil]
      optional :total_replay_watched, Integer, api_name: :totalReplayWatched

      # @!attribute participant_count
      #   Accounts in the Space now, while it is live
      #
      #   @return [Integer, nil]
      optional :participant_count, Integer, api_name: :participantCount

      # @!attribute is_available_for_replay
      #   Whether X offers a recording
      #
      #   @return [Boolean, nil]
      optional :is_available_for_replay,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :isAvailableForReplay

      # @!attribute is_available_for_clipping
      #   Whether listeners may clip the Space
      #
      #   @return [Boolean, nil]
      optional :is_available_for_clipping,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :isAvailableForClipping

      # @!attribute is_locked
      #   Whether the host locked the Space
      #
      #   @return [Boolean, nil]
      optional :is_locked, XTwitterScraper::Internal::Type::Boolean, api_name: :isLocked

      # @!attribute is_employee_only
      #   Whether only X employees may join
      #
      #   @return [Boolean, nil]
      optional :is_employee_only, XTwitterScraper::Internal::Type::Boolean, api_name: :isEmployeeOnly

      # @!attribute disallow_join
      #   Whether X lets no more accounts join
      #
      #   @return [Boolean, nil]
      optional :disallow_join, XTwitterScraper::Internal::Type::Boolean, api_name: :disallowJoin

      # @!attribute no_incognito
      #   Whether anonymous listening is off
      #
      #   @return [Boolean, nil]
      optional :no_incognito, XTwitterScraper::Internal::Type::Boolean, api_name: :noIncognito

      # @!attribute content_type
      #   Audio or video kind, as X names it
      #
      #   @return [String, nil]
      optional :content_type, String, api_name: :contentType

      # @!attribute conversation_controls
      #   X's code for who may speak
      #
      #   @return [Integer, nil]
      optional :conversation_controls, Integer, api_name: :conversationControls

      # @!attribute max_admin_capacity
      #   Most hosts and co-hosts the Space allows
      #
      #   @return [Integer, nil]
      optional :max_admin_capacity, Integer, api_name: :maxAdminCapacity

      # @!attribute media_key
      #   X's media key for the Space's audio
      #
      #   @return [String, nil]
      optional :media_key, String, api_name: :mediaKey

      # @!attribute mentioned_user_ids
      #   IDs of the accounts the host tagged
      #
      #   @return [Array<String>, nil]
      optional :mentioned_user_ids,
               XTwitterScraper::Internal::Type::ArrayOf[String],
               api_name: :mentionedUserIds

      # @!attribute tweet_id
      #   ID of the post that announces the Space
      #
      #   @return [String, nil]
      optional :tweet_id, String, api_name: :tweetId

      # @!attribute tweet
      #   Search tweet with author. Zero metrics may mean X omitted counts.
      #
      #   @return [XTwitterScraper::Models::SearchTweet, nil]
      optional :tweet, -> { XTwitterScraper::Models::SearchTweet }

      # @!attribute creator
      #   Public X profile.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :creator, -> { XTwitterScraper::Models::UserProfile }

      # @!attribute admins
      #   Hosts and co-hosts
      #
      #   @return [Array<XTwitterScraper::Models::SpaceParticipant>]
      required :admins, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SpaceParticipant] }

      # @!attribute speakers
      #   Accounts X lists as speakers
      #
      #   @return [Array<XTwitterScraper::Models::SpaceParticipant>]
      required :speakers, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SpaceParticipant] }

      # @!attribute listeners
      #   Accounts X lists as listeners
      #
      #   @return [Array<XTwitterScraper::Models::SpaceParticipant>]
      required :listeners, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SpaceParticipant] }

      # @!attribute sharings
      #   Posts the hosts and speakers shared in the Space, in X's order. Present only
      #   when X lists them.
      #
      #   @return [Array<XTwitterScraper::Models::SpaceSharing>, nil]
      optional :sharings, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SpaceSharing] }

      # @!method initialize(id:, admins:, speakers:, listeners:, title: nil, state: nil, created_at: nil, scheduled_start: nil, started_at: nil, ended_at: nil, updated_at: nil, total_live_listeners: nil, total_replay_watched: nil, participant_count: nil, is_available_for_replay: nil, is_available_for_clipping: nil, is_locked: nil, is_employee_only: nil, disallow_join: nil, no_incognito: nil, content_type: nil, conversation_controls: nil, max_admin_capacity: nil, media_key: nil, mentioned_user_ids: nil, tweet_id: nil, tweet: nil, creator: nil, sharings: nil)
      #   X Space
      #
      #   @param id [String] Space ID
      #
      #   @param admins [Array<XTwitterScraper::Models::SpaceParticipant>] Hosts and co-hosts
      #
      #   @param speakers [Array<XTwitterScraper::Models::SpaceParticipant>] Accounts X lists as speakers
      #
      #   @param listeners [Array<XTwitterScraper::Models::SpaceParticipant>] Accounts X lists as listeners
      #
      #   @param title [String] Space title
      #
      #   @param state [String] NotStarted (scheduled), Running (live), Ended, Canceled (scheduled, never started) or TimedOut (closed by X, not by its host)
      #
      #   @param created_at [Time] When the Space was made
      #
      #   @param scheduled_start [Time] When the Space was set to start
      #
      #   @param started_at [Time] When the Space went live
      #
      #   @param ended_at [Time] When the Space ended
      #
      #   @param updated_at [Time] When X last changed the Space
      #
      #   @param total_live_listeners [Integer] Accounts that listened live
      #
      #   @param total_replay_watched [Integer] Accounts that played the recording
      #
      #   @param participant_count [Integer] Accounts in the Space now, while it is live
      #
      #   @param is_available_for_replay [Boolean] Whether X offers a recording
      #
      #   @param is_available_for_clipping [Boolean] Whether listeners may clip the Space
      #
      #   @param is_locked [Boolean] Whether the host locked the Space
      #
      #   @param is_employee_only [Boolean] Whether only X employees may join
      #
      #   @param disallow_join [Boolean] Whether X lets no more accounts join
      #
      #   @param no_incognito [Boolean] Whether anonymous listening is off
      #
      #   @param content_type [String] Audio or video kind, as X names it
      #
      #   @param conversation_controls [Integer] X's code for who may speak
      #
      #   @param max_admin_capacity [Integer] Most hosts and co-hosts the Space allows
      #
      #   @param media_key [String] X's media key for the Space's audio
      #
      #   @param mentioned_user_ids [Array<String>] IDs of the accounts the host tagged
      #
      #   @param tweet_id [String] ID of the post that announces the Space
      #
      #   @param tweet [XTwitterScraper::Models::SearchTweet] Search tweet with author. Zero metrics may mean X omitted counts.
      #
      #   @param creator [XTwitterScraper::Models::UserProfile] Public X profile.
      #
      #   @param sharings [Array<XTwitterScraper::Models::SpaceSharing>] Posts the hosts and speakers shared in the Space, in X's order. Present only when X lists them.
    end
  end
end
