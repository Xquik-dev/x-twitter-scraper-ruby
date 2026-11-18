# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class JobAccount < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X user ID of the account.
      #
      #   @return [String]
      required :id, String

      # @!attribute username
      #   Handle without @.
      #
      #   @return [String, nil]
      optional :username, String

      # @!attribute name
      #   Display name of the account that posted the job.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute verified
      #   Whether X shows a verification badge on the account.
      #
      #   @return [Boolean]
      required :verified, XTwitterScraper::Internal::Type::Boolean

      # @!attribute verified_type
      #   Badge type, such as Business or Government.
      #
      #   @return [String, nil]
      optional :verified_type, String, api_name: :verifiedType

      # @!attribute description
      #   Bio of the account. A job lookup returns it.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute profile_picture
      #   Avatar URL of the account that posted the job.
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute profile_picture_original
      #   The job account's avatar at full size.
      #
      #   @return [String, nil]
      optional :profile_picture_original, String, api_name: :profilePictureOriginal

      # @!attribute profile_image_shape
      #   Avatar shape, such as Circle or Square.
      #
      #   @return [String, nil]
      optional :profile_image_shape, String, api_name: :profileImageShape

      # @!method initialize(id:, verified:, username: nil, name: nil, verified_type: nil, description: nil, profile_picture: nil, profile_picture_original: nil, profile_image_shape: nil)
      #   The X account that posted a job. A job has none when X imported it from a job
      #   board or no longer shows the account.
      #
      #   @param id [String] X user ID of the account.
      #
      #   @param verified [Boolean] Whether X shows a verification badge on the account.
      #
      #   @param username [String] Handle without @.
      #
      #   @param name [String] Display name of the account that posted the job.
      #
      #   @param verified_type [String] Badge type, such as Business or Government.
      #
      #   @param description [String] Bio of the account. A job lookup returns it.
      #
      #   @param profile_picture [String] Avatar URL of the account that posted the job.
      #
      #   @param profile_picture_original [String] The job account's avatar at full size.
      #
      #   @param profile_image_shape [String] Avatar shape, such as Circle or Square.
    end
  end
end
