# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityRetrieveInfoResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Community info object
        sig do
          returns(
            XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
          )
        end
        attr_reader :community

        sig do
          params(
            community:
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::OrHash
          ).void
        end
        attr_writer :community

        sig do
          params(
            community:
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Community info object
          community:
        )
        end

        sig do
          override.returns(
            {
              community:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community
            }
          )
        end
        def to_hash
        end

        class Community < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Unique community identifier
          sig { returns(String) }
          attr_accessor :id

          # Community banner image URL
          sig { returns(T.nilable(String)) }
          attr_reader :banner_url

          sig { params(banner_url: String).void }
          attr_writer :banner_url

          # Community creation timestamp
          sig { returns(T.nilable(String)) }
          attr_reader :created_at

          sig { params(created_at: String).void }
          attr_writer :created_at

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator
              )
            )
          end
          attr_reader :creator

          sig do
            params(
              creator:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator::OrHash
            ).void
          end
          attr_writer :creator

          # About text for the community
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Invitation policy
          sig { returns(T.nilable(String)) }
          attr_reader :invites_policy

          sig { params(invites_policy: String).void }
          attr_writer :invites_policy

          # Whether the authenticated viewer is a member
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_member

          sig { params(is_member: T::Boolean).void }
          attr_writer :is_member

          # Whether the community is marked sensitive
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :is_nsfw

          sig { params(is_nsfw: T::Boolean).void }
          attr_writer :is_nsfw

          # Join policy (open or restricted)
          sig { returns(T.nilable(String)) }
          attr_reader :join_policy

          sig { params(join_policy: String).void }
          attr_writer :join_policy

          # Total member count
          sig { returns(T.nilable(Integer)) }
          attr_reader :member_count

          sig { params(member_count: Integer).void }
          attr_writer :member_count

          # Total moderator count
          sig { returns(T.nilable(Integer)) }
          attr_reader :moderator_count

          sig { params(moderator_count: Integer).void }
          attr_writer :moderator_count

          # Display name of the community
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Primary topic
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic
              )
            )
          end
          attr_reader :primary_topic

          sig do
            params(
              primary_topic:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic::OrHash
            ).void
          end
          attr_writer :primary_topic

          # Authenticated viewer's community role
          sig { returns(T.nilable(String)) }
          attr_reader :role

          sig { params(role: String).void }
          attr_writer :role

          # Community rules
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule
                ]
              )
            )
          end
          attr_reader :rules

          sig do
            params(
              rules:
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule::OrHash
                ]
            ).void
          end
          attr_writer :rules

          # Community info object
          sig do
            params(
              id: String,
              banner_url: String,
              created_at: String,
              creator:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator::OrHash,
              description: String,
              invites_policy: String,
              is_member: T::Boolean,
              is_nsfw: T::Boolean,
              join_policy: String,
              member_count: Integer,
              moderator_count: Integer,
              name: String,
              primary_topic:
                XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic::OrHash,
              role: String,
              rules:
                T::Array[
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique community identifier
            id:,
            # Community banner image URL
            banner_url: nil,
            # Community creation timestamp
            created_at: nil,
            creator: nil,
            # About text for the community
            description: nil,
            # Invitation policy
            invites_policy: nil,
            # Whether the authenticated viewer is a member
            is_member: nil,
            # Whether the community is marked sensitive
            is_nsfw: nil,
            # Join policy (open or restricted)
            join_policy: nil,
            # Total member count
            member_count: nil,
            # Total moderator count
            moderator_count: nil,
            # Display name of the community
            name: nil,
            # Primary topic
            primary_topic: nil,
            # Authenticated viewer's community role
            role: nil,
            # Community rules
            rules: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                banner_url: String,
                created_at: String,
                creator:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator,
                description: String,
                invites_policy: String,
                is_member: T::Boolean,
                is_nsfw: T::Boolean,
                join_policy: String,
                member_count: Integer,
                moderator_count: Integer,
                name: String,
                primary_topic:
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic,
                role: String,
                rules:
                  T::Array[
                    XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule
                  ]
              }
            )
          end
          def to_hash
          end

          class Creator < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Creator,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(String) }
            attr_accessor :username

            sig { returns(T::Boolean) }
            attr_accessor :verified

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              params(
                id: String,
                username: String,
                verified: T::Boolean,
                name: String
              ).returns(T.attached_class)
            end
            def self.new(id:, username:, verified:, name: nil)
            end

            sig do
              override.returns(
                {
                  id: String,
                  username: String,
                  verified: T::Boolean,
                  name: String
                }
              )
            end
            def to_hash
            end
          end

          class PrimaryTopic < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::PrimaryTopic,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            # Primary topic
            sig { params(id: String, name: String).returns(T.attached_class) }
            def self.new(id: nil, name: nil)
            end

            sig { override.returns({ id: String, name: String }) }
            def to_hash
            end
          end

          class Rule < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::CommunityRetrieveInfoResponse::Community::Rule,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig do
              params(id: String, description: String, name: String).returns(
                T.attached_class
              )
            end
            def self.new(id: nil, description: nil, name: nil)
            end

            sig do
              override.returns(
                { id: String, description: String, name: String }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
