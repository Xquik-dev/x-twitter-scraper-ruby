# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ProfileContactInfo < XTwitterScraper::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(XTwitterScraper::ProfileContactInfo, XTwitterScraper::Internal::AnyHash) }

      # Emails in the bio, name or location, lowercased.
      sig { returns(T.nilable(T::Array[XTwitterScraper::ProfileContactInfo::Email])) }
      attr_reader :emails

      sig { params(emails: T::Array[XTwitterScraper::ProfileContactInfo::Email::OrHash]).void }
      attr_writer :emails

      # Phone numbers on the profile. Only a spelling that can be nothing else counts.
      sig { returns(T.nilable(T::Array[XTwitterScraper::ProfileContactInfo::Phone])) }
      attr_reader :phones

      sig { params(phones: T::Array[XTwitterScraper::ProfileContactInfo::Phone::OrHash]).void }
      attr_writer :phones

      # The profile's website & the links in its bio.
      sig { returns(T.nilable(T::Array[XTwitterScraper::ProfileContactInfo::Link])) }
      attr_reader :links

      sig { params(links: T::Array[XTwitterScraper::ProfileContactInfo::Link::OrHash]).void }
      attr_writer :links

      # Emails, phone numbers & links the account publishes on its own profile. Omitted
      # when it publishes none.
      sig { params(emails: T::Array[XTwitterScraper::ProfileContactInfo::Email::OrHash], phones: T::Array[XTwitterScraper::ProfileContactInfo::Phone::OrHash], links: T::Array[XTwitterScraper::ProfileContactInfo::Link::OrHash]).returns(T.attached_class) }
      def self.new(
        # Emails in the bio, name or location, lowercased.
        emails: nil,
        # Phone numbers on the profile. Only a spelling that can be nothing else counts.
        phones: nil,
        # The profile's website & the links in its bio.
        links: nil
      )
      end

      sig { override.returns({ emails: T::Array[XTwitterScraper::ProfileContactInfo::Email], phones: T::Array[XTwitterScraper::ProfileContactInfo::Phone], links: T::Array[XTwitterScraper::ProfileContactInfo::Link] }) }
      def to_hash
      end

      class Email < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::ProfileContactInfo::Email, XTwitterScraper::Internal::AnyHash) }

        # The email address.
        sig { returns(String) }
        attr_accessor :value

        # The part after the @ sign.
        sig { returns(String) }
        attr_accessor :domain

        # Profile field that holds the email.
        sig { returns(XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol) }
        attr_accessor :source

        # The account's own spelling, sent when it spelled the email out.
        sig { returns(T.nilable(String)) }
        attr_reader :written_as

        sig { params(written_as: String).void }
        attr_writer :written_as

        sig { params(value: String, domain: String, source: XTwitterScraper::ProfileContactInfo::Email::Source::OrSymbol, written_as: String).returns(T.attached_class) }
        def self.new(
          # The email address.
          value:,
          # The part after the @ sign.
          domain:,
          # Profile field that holds the email.
          source:,
          # The account's own spelling, sent when it spelled the email out.
          written_as: nil
        )
        end

        sig { override.returns({ value: String, domain: String, source: XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol, written_as: String }) }
        def to_hash
        end

        # Profile field that holds the email.
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, XTwitterScraper::ProfileContactInfo::Email::Source) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BIO = T.let(:bio, XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol)
          NAME = T.let(:name, XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol)
          LOCATION = T.let(:location, XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol)

          sig { override.returns(T::Array[XTwitterScraper::ProfileContactInfo::Email::Source::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class Phone < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::ProfileContactInfo::Phone, XTwitterScraper::Internal::AnyHash) }

        # The digits, with a leading + when the account wrote a country code.
        sig { returns(String) }
        attr_accessor :value

        # Profile field that holds the number.
        sig { returns(XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol) }
        attr_accessor :source

        # The account's own spelling of the number.
        sig { returns(T.nilable(String)) }
        attr_reader :written_as

        sig { params(written_as: String).void }
        attr_writer :written_as

        sig { params(value: String, source: XTwitterScraper::ProfileContactInfo::Phone::Source::OrSymbol, written_as: String).returns(T.attached_class) }
        def self.new(
          # The digits, with a leading + when the account wrote a country code.
          value:,
          # Profile field that holds the number.
          source:,
          # The account's own spelling of the number.
          written_as: nil
        )
        end

        sig { override.returns({ value: String, source: XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol, written_as: String }) }
        def to_hash
        end

        # Profile field that holds the number.
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, XTwitterScraper::ProfileContactInfo::Phone::Source) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BIO = T.let(:bio, XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol)
          NAME = T.let(:name, XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol)
          LOCATION = T.let(:location, XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol)
          URL = T.let(:url, XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol)

          sig { override.returns(T::Array[XTwitterScraper::ProfileContactInfo::Phone::Source::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class Link < XTwitterScraper::Internal::Type::BaseModel
        OrHash = T.type_alias { T.any(XTwitterScraper::ProfileContactInfo::Link, XTwitterScraper::Internal::AnyHash) }

        # The link, as X expands it.
        sig { returns(String) }
        attr_accessor :url

        # Site the link belongs to, such as `linkedin`, `github` or `telegram`. Any other
        # site is `website`.
        sig { returns(String) }
        attr_accessor :network

        # `url` for the website field, `bio` for a bio link.
        sig { returns(XTwitterScraper::ProfileContactInfo::Link::Source::TaggedSymbol) }
        attr_accessor :source

        sig { params(url: String, network: String, source: XTwitterScraper::ProfileContactInfo::Link::Source::OrSymbol).returns(T.attached_class) }
        def self.new(
          # The link, as X expands it.
          url:,
          # Site the link belongs to, such as `linkedin`, `github` or `telegram`. Any other
          # site is `website`.
          network:,
          # `url` for the website field, `bio` for a bio link.
          source:
        )
        end

        sig { override.returns({ url: String, network: String, source: XTwitterScraper::ProfileContactInfo::Link::Source::TaggedSymbol }) }
        def to_hash
        end

        # `url` for the website field, `bio` for a bio link.
        module Source
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, XTwitterScraper::ProfileContactInfo::Link::Source) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          URL = T.let(:url, XTwitterScraper::ProfileContactInfo::Link::Source::TaggedSymbol)
          BIO = T.let(:bio, XTwitterScraper::ProfileContactInfo::Link::Source::TaggedSymbol)

          sig { override.returns(T::Array[XTwitterScraper::ProfileContactInfo::Link::Source::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
