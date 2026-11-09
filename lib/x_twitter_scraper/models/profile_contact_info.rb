# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ProfileContactInfo < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute emails
      #   Emails in the bio, name or location, lowercased.
      #
      #   @return [Array<XTwitterScraper::Models::ProfileContactInfo::Email>, nil]
      optional :emails,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ProfileContactInfo::Email] }

      # @!attribute phones
      #   Phone numbers on the profile. Only a spelling that can be nothing else counts.
      #
      #   @return [Array<XTwitterScraper::Models::ProfileContactInfo::Phone>, nil]
      optional :phones,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ProfileContactInfo::Phone] }

      # @!attribute links
      #   The profile's website & the links in its bio.
      #
      #   @return [Array<XTwitterScraper::Models::ProfileContactInfo::Link>, nil]
      optional :links,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::ProfileContactInfo::Link] }

      # @!method initialize(emails: nil, phones: nil, links: nil)
      #   Emails, phone numbers & links the account publishes on its own profile. Omitted
      #   when it publishes none.
      #
      #   @param emails [Array<XTwitterScraper::Models::ProfileContactInfo::Email>] Emails in the bio, name or location, lowercased.
      #
      #   @param phones [Array<XTwitterScraper::Models::ProfileContactInfo::Phone>] Phone numbers on the profile. Only a spelling that can be nothing else counts.
      #
      #   @param links [Array<XTwitterScraper::Models::ProfileContactInfo::Link>] The profile's website & the links in its bio.

      # @see XTwitterScraper::Models::ProfileContactInfo#emails
      class Email < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute value
        #   The email address.
        #
        #   @return [String]
        required :value, String

        # @!attribute domain
        #   The part after the @ sign.
        #
        #   @return [String]
        required :domain, String

        # @!attribute source
        #   Profile field that holds the email.
        #
        #   @return [Symbol, XTwitterScraper::Models::ProfileContactInfo::Email::Source]
        required :source, enum: -> { XTwitterScraper::ProfileContactInfo::Email::Source }

        # @!attribute written_as
        #   The account's own spelling, sent when it spelled the email out.
        #
        #   @return [String, nil]
        optional :written_as, String, api_name: :writtenAs

        # @!method initialize(value:, domain:, source:, written_as: nil)
        #   @param value [String] The email address.
        #
        #   @param domain [String] The part after the @ sign.
        #
        #   @param source [Symbol, XTwitterScraper::Models::ProfileContactInfo::Email::Source] Profile field that holds the email.
        #
        #   @param written_as [String] The account's own spelling, sent when it spelled the email out.

        # Profile field that holds the email.
        #
        # @see XTwitterScraper::Models::ProfileContactInfo::Email#source
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          BIO = :bio
          NAME = :name
          LOCATION = :location

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see XTwitterScraper::Models::ProfileContactInfo#phones
      class Phone < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute value
        #   The digits, with a leading + when the account wrote a country code.
        #
        #   @return [String]
        required :value, String

        # @!attribute source
        #   Profile field that holds the number.
        #
        #   @return [Symbol, XTwitterScraper::Models::ProfileContactInfo::Phone::Source]
        required :source, enum: -> { XTwitterScraper::ProfileContactInfo::Phone::Source }

        # @!attribute written_as
        #   The account's own spelling of the number.
        #
        #   @return [String, nil]
        optional :written_as, String, api_name: :writtenAs

        # @!method initialize(value:, source:, written_as: nil)
        #   @param value [String] The digits, with a leading + when the account wrote a country code.
        #
        #   @param source [Symbol, XTwitterScraper::Models::ProfileContactInfo::Phone::Source] Profile field that holds the number.
        #
        #   @param written_as [String] The account's own spelling of the number.

        # Profile field that holds the number.
        #
        # @see XTwitterScraper::Models::ProfileContactInfo::Phone#source
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          BIO = :bio
          NAME = :name
          LOCATION = :location
          URL = :url

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see XTwitterScraper::Models::ProfileContactInfo#links
      class Link < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute url
        #   The link, as X expands it.
        #
        #   @return [String]
        required :url, String

        # @!attribute network
        #   Site the link belongs to, such as `linkedin`, `github` or `telegram`. Any other
        #   site is `website`.
        #
        #   @return [String]
        required :network, String

        # @!attribute source
        #   `url` for the website field, `bio` for a bio link.
        #
        #   @return [Symbol, XTwitterScraper::Models::ProfileContactInfo::Link::Source]
        required :source, enum: -> { XTwitterScraper::ProfileContactInfo::Link::Source }

        # @!method initialize(url:, network:, source:)
        #   @param url [String] The link, as X expands it.
        #
        #   @param network [String] Site the link belongs to, such as `linkedin`, `github` or `telegram`. Any other
        #
        #   @param source [Symbol, XTwitterScraper::Models::ProfileContactInfo::Link::Source] `url` for the website field, `bio` for a bio link.

        # `url` for the website field, `bio` for a bio link.
        #
        # @see XTwitterScraper::Models::ProfileContactInfo::Link#source
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          URL = :url
          BIO = :bio

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
