# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class JobAccount < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::JobAccount,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X user ID of the account.
      sig { returns(String) }
      attr_accessor :id

      # Handle without @.
      sig { returns(T.nilable(String)) }
      attr_reader :username

      sig { params(username: String).void }
      attr_writer :username

      # Display name of the account that posted the job.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Whether X shows a verification badge on the account.
      sig { returns(T::Boolean) }
      attr_accessor :verified

      # Badge type, such as Business or Government.
      sig { returns(T.nilable(String)) }
      attr_reader :verified_type

      sig { params(verified_type: String).void }
      attr_writer :verified_type

      # Bio of the account. A job lookup returns it.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Avatar URL of the account that posted the job.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

      # The job account's avatar at full size.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_original

      sig { params(profile_picture_original: String).void }
      attr_writer :profile_picture_original

      # Avatar shape, such as Circle or Square.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_image_shape

      sig { params(profile_image_shape: String).void }
      attr_writer :profile_image_shape

      sig do
        params(
          id: String,
          verified: T::Boolean,
          username: String,
          name: String,
          verified_type: String,
          description: String,
          profile_picture: String,
          profile_picture_original: String,
          profile_image_shape: String
        ).returns(T.attached_class)
      end
      def self.new(
        # X user ID of the account.
        id:,
        # Whether X shows a verification badge on the account.
        verified:,
        # Handle without @.
        username: nil,
        # Display name of the account that posted the job.
        name: nil,
        # Badge type, such as Business or Government.
        verified_type: nil,
        # Bio of the account. A job lookup returns it.
        description: nil,
        # Avatar URL of the account that posted the job.
        profile_picture: nil,
        # The job account's avatar at full size.
        profile_picture_original: nil,
        # Avatar shape, such as Circle or Square.
        profile_image_shape: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            username: String,
            name: String,
            verified: T::Boolean,
            verified_type: String,
            description: String,
            profile_picture: String,
            profile_picture_original: String,
            profile_image_shape: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
