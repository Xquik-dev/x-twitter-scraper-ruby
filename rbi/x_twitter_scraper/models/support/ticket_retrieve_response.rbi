# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Support::TicketRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message
              ]
            )
          )
        end
        attr_reader :messages

        sig do
          params(
            messages:
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::OrHash
              ]
          ).void
        end
        attr_writer :messages

        sig { returns(T.nilable(String)) }
        attr_reader :public_id

        sig { params(public_id: String).void }
        attr_writer :public_id

        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        sig { returns(T.nilable(String)) }
        attr_reader :subject

        sig { params(subject: String).void }
        attr_writer :subject

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig do
          params(
            created_at: Time,
            messages:
              T::Array[
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::OrHash
              ],
            public_id: String,
            status: String,
            subject: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          created_at: nil,
          messages: nil,
          public_id: nil,
          status: nil,
          subject: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              created_at: Time,
              messages:
                T::Array[
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message
                ],
              public_id: String,
              status: String,
              subject: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        class Message < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment
                ]
              )
            )
          end
          attr_reader :attachments

          sig do
            params(
              attachments:
                T::Array[
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::OrHash
                ]
            ).void
          end
          attr_writer :attachments

          sig { returns(T.nilable(String)) }
          attr_reader :body

          sig { params(body: String).void }
          attr_writer :body

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(String)) }
          attr_reader :sender

          sig { params(sender: String).void }
          attr_writer :sender

          sig do
            params(
              attachments:
                T::Array[
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::OrHash
                ],
              body: String,
              created_at: Time,
              sender: String
            ).returns(T.attached_class)
          end
          def self.new(
            attachments: nil,
            body: nil,
            created_at: nil,
            sender: nil
          )
          end

          sig do
            override.returns(
              {
                attachments:
                  T::Array[
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment
                  ],
                body: String,
                created_at: Time,
                sender: String
              }
            )
          end
          def to_hash
          end

          class Attachment < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Validated media type.
            sig do
              returns(
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
              )
            end
            attr_accessor :content_type

            sig { returns(String) }
            attr_accessor :filename

            # Attachment media class.
            sig do
              returns(
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::TaggedSymbol
              )
            end
            attr_accessor :kind

            sig { returns(String) }
            attr_accessor :public_id

            sig { returns(Integer) }
            attr_accessor :size_bytes

            # Storage processing state.
            sig do
              returns(
                XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol
              )
            end
            attr_accessor :status

            sig { returns(String) }
            attr_accessor :url

            # Downloadable image or video attached to a support message.
            sig do
              params(
                content_type:
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::OrSymbol,
                filename: String,
                kind:
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::OrSymbol,
                public_id: String,
                size_bytes: Integer,
                status:
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::OrSymbol,
                url: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Validated media type.
              content_type:,
              filename:,
              # Attachment media class.
              kind:,
              public_id:,
              size_bytes:,
              # Storage processing state.
              status:,
              url:
            )
            end

            sig do
              override.returns(
                {
                  content_type:
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol,
                  filename: String,
                  kind:
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::TaggedSymbol,
                  public_id: String,
                  size_bytes: Integer,
                  status:
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol,
                  url: String
                }
              )
            end
            def to_hash
            end

            # Validated media type.
            module ContentType
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IMAGE_JPEG =
                T.let(
                  :"image/jpeg",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              IMAGE_PNG =
                T.let(
                  :"image/png",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              IMAGE_GIF =
                T.let(
                  :"image/gif",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              IMAGE_WEBP =
                T.let(
                  :"image/webp",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              VIDEO_MP4 =
                T.let(
                  :"video/mp4",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              VIDEO_QUICKTIME =
                T.let(
                  :"video/quicktime",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )
              VIDEO_WEBM =
                T.let(
                  :"video/webm",
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::ContentType::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Attachment media class.
            module Kind
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IMAGE =
                T.let(
                  :image,
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::TaggedSymbol
                )
              VIDEO =
                T.let(
                  :video,
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Kind::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Storage processing state.
            module Status
              extend XTwitterScraper::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PENDING =
                T.let(
                  :pending,
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol
                )
              READY =
                T.let(
                  :ready,
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol
                )
              FAILED =
                T.let(
                  :failed,
                  XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::Support::TicketRetrieveResponse::Message::Attachment::Status::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
