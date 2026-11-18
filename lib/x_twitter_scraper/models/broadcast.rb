# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Broadcast < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Broadcast ID
      #
      #   @return [String]
      required :id, String

      # @!attribute title
      #   Broadcast title
      #
      #   @return [String, nil]
      optional :title, String

      # @!attribute is_title_edited
      #   Whether the broadcaster edited the title of the replay
      #
      #   @return [Boolean, nil]
      optional :is_title_edited, XTwitterScraper::Internal::Type::Boolean, api_name: :isTitleEdited

      # @!attribute state
      #   State, such as NotStarted, Running or Ended, as X names it
      #
      #   @return [String, nil]
      optional :state, String

      # @!attribute scheduled_start
      #   When the broadcast was set to start
      #
      #   @return [Time, nil]
      optional :scheduled_start, Time, api_name: :scheduledStart

      # @!attribute started_at
      #   When the broadcast went live
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt

      # @!attribute ended_at
      #   When the broadcast ended
      #
      #   @return [Time, nil]
      optional :ended_at, Time, api_name: :endedAt

      # @!attribute last_ping_at
      #   When the video stream last reached X
      #
      #   @return [Time, nil]
      optional :last_ping_at, Time, api_name: :lastPingAt

      # @!attribute total_watched
      #   Accounts that watched, live or after
      #
      #   @return [Integer, nil]
      optional :total_watched, Integer, api_name: :totalWatched

      # @!attribute total_watching
      #   Accounts watching, as X counts them
      #
      #   @return [Integer, nil]
      optional :total_watching, Integer, api_name: :totalWatching

      # @!attribute is_available_for_replay
      #   Whether X offers a recording of the broadcast
      #
      #   @return [Boolean, nil]
      optional :is_available_for_replay,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :isAvailableForReplay

      # @!attribute width
      #   Video width in pixels
      #
      #   @return [Integer, nil]
      optional :width, Integer

      # @!attribute height
      #   Video height in pixels
      #
      #   @return [Integer, nil]
      optional :height, Integer

      # @!attribute camera_rotation
      #   Camera rotation in degrees
      #
      #   @return [Integer, nil]
      optional :camera_rotation, Integer, api_name: :cameraRotation

      # @!attribute is_high_latency
      #   Whether the video stream runs in high-latency mode
      #
      #   @return [Boolean, nil]
      optional :is_high_latency, XTwitterScraper::Internal::Type::Boolean, api_name: :isHighLatency

      # @!attribute chat_option
      #   X's code for who may chat
      #
      #   @return [Integer, nil]
      optional :chat_option, Integer, api_name: :chatOption

      # @!attribute is_private_chat
      #   Whether X marks the chat private
      #
      #   @return [Boolean, nil]
      optional :is_private_chat, XTwitterScraper::Internal::Type::Boolean, api_name: :isPrivateChat

      # @!attribute source
      #   What produced the video stream, as X names it
      #
      #   @return [String, nil]
      optional :source, String

      # @!attribute media_key
      #   X's media key for the video
      #
      #   @return [String, nil]
      optional :media_key, String, api_name: :mediaKey

      # @!attribute pre_live_slate_url
      #   Image X shows before the broadcast starts
      #
      #   @return [String, nil]
      optional :pre_live_slate_url, String, api_name: :preLiveSlateUrl

      # @!attribute version
      #   X's revision number of the broadcast
      #
      #   @return [Integer, nil]
      optional :version, Integer

      # @!attribute tweet_id
      #   ID of the post that announces the broadcast
      #
      #   @return [String, nil]
      optional :tweet_id, String, api_name: :tweetId

      # @!attribute tweet
      #   Search tweet with author. Zero metrics may mean X omitted counts.
      #
      #   @return [XTwitterScraper::Models::SearchTweet, nil]
      optional :tweet, -> { XTwitterScraper::Models::SearchTweet }

      # @!attribute periscope_user
      #   Broadcaster, as X's live video service names the account
      #
      #   @return [XTwitterScraper::Models::Broadcast::PeriscopeUser, nil]
      optional :periscope_user, -> { XTwitterScraper::Models::Broadcast::PeriscopeUser }, api_name: :periscopeUser

      # @!attribute creator
      #   Public X profile.
      #
      #   @return [XTwitterScraper::Models::UserProfile, nil]
      optional :creator, -> { XTwitterScraper::Models::UserProfile }

      # @!method initialize(id:, title: nil, is_title_edited: nil, state: nil, scheduled_start: nil, started_at: nil, ended_at: nil, last_ping_at: nil, total_watched: nil, total_watching: nil, is_available_for_replay: nil, width: nil, height: nil, camera_rotation: nil, is_high_latency: nil, chat_option: nil, is_private_chat: nil, source: nil, media_key: nil, pre_live_slate_url: nil, version: nil, tweet_id: nil, tweet: nil, periscope_user: nil, creator: nil)
      #   X broadcast, a live video
      #
      #   @param id [String] Broadcast ID
      #
      #   @param title [String] Broadcast title
      #
      #   @param is_title_edited [Boolean] Whether the broadcaster edited the title of the replay
      #
      #   @param state [String] State, such as NotStarted, Running or Ended, as X names it
      #
      #   @param scheduled_start [Time] When the broadcast was set to start
      #
      #   @param started_at [Time] When the broadcast went live
      #
      #   @param ended_at [Time] When the broadcast ended
      #
      #   @param last_ping_at [Time] When the video stream last reached X
      #
      #   @param total_watched [Integer] Accounts that watched, live or after
      #
      #   @param total_watching [Integer] Accounts watching, as X counts them
      #
      #   @param is_available_for_replay [Boolean] Whether X offers a recording of the broadcast
      #
      #   @param width [Integer] Video width in pixels
      #
      #   @param height [Integer] Video height in pixels
      #
      #   @param camera_rotation [Integer] Camera rotation in degrees
      #
      #   @param is_high_latency [Boolean] Whether the video stream runs in high-latency mode
      #
      #   @param chat_option [Integer] X's code for who may chat
      #
      #   @param is_private_chat [Boolean] Whether X marks the chat private
      #
      #   @param source [String] What produced the video stream, as X names it
      #
      #   @param media_key [String] X's media key for the video
      #
      #   @param pre_live_slate_url [String] Image X shows before the broadcast starts
      #
      #   @param version [Integer] X's revision number of the broadcast
      #
      #   @param tweet_id [String] ID of the post that announces the broadcast
      #
      #   @param tweet [XTwitterScraper::Models::SearchTweet] Search tweet with author. Zero metrics may mean X omitted counts.
      #
      #   @param periscope_user [XTwitterScraper::Models::Broadcast::PeriscopeUser] Broadcaster, as X's live video service names the account
      #
      #   @param creator [XTwitterScraper::Models::UserProfile] Public X profile.

      class PeriscopeUser < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #   Live video account ID
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute username
        #   Live video username
        #
        #   @return [String, nil]
        optional :username, String

        # @!attribute display_name
        #   Live video display name
        #
        #   @return [String, nil]
        optional :display_name, String, api_name: :displayName

        # @!attribute profile_picture
        #   Live video avatar URL
        #
        #   @return [String, nil]
        optional :profile_picture, String, api_name: :profilePicture

        # @!attribute profile_picture_original
        #   The broadcaster's avatar at full size
        #
        #   @return [String, nil]
        optional :profile_picture_original, String, api_name: :profilePictureOriginal

        # @!method initialize(id: nil, username: nil, display_name: nil, profile_picture: nil, profile_picture_original: nil)
        #   Broadcaster, as X's live video service names the account
        #
        #   @param id [String] Live video account ID
        #
        #   @param username [String] Live video username
        #
        #   @param display_name [String] Live video display name
        #
        #   @param profile_picture [String] Live video avatar URL
        #
        #   @param profile_picture_original [String] The broadcaster's avatar at full size
      end
    end
  end
end
