# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  [
    XTwitterScraper::Internal::Type::BaseModel,
    *XTwitterScraper::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, XTwitterScraper::Internal::AnyHash) } }
  end

  XTwitterScraper::Internal::Util.walk_namespaces(XTwitterScraper::Models).each do |mod|
    case mod
    in XTwitterScraper::Internal::Type::Enum | XTwitterScraper::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  XTwitterScraper::Internal::Util.walk_namespaces(XTwitterScraper::Models)
                                 .lazy
                                 .grep(XTwitterScraper::Internal::Type::Union)
                                 .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AccountRetrieveParams = XTwitterScraper::Models::AccountRetrieveParams

  AccountSetXUsernameParams = XTwitterScraper::Models::AccountSetXUsernameParams

  AccountUpdateLocaleParams = XTwitterScraper::Models::AccountUpdateLocaleParams

  ComposeCreateParams = XTwitterScraper::Models::ComposeCreateParams

  ContentDisclosure = XTwitterScraper::Models::ContentDisclosure

  CreditRedirectTopupCheckoutParams = XTwitterScraper::Models::CreditRedirectTopupCheckoutParams

  CreditRetrieveBalanceParams = XTwitterScraper::Models::CreditRetrieveBalanceParams

  CreditRetrieveTopupStatusParams = XTwitterScraper::Models::CreditRetrieveTopupStatusParams

  CreditTopupBalanceParams = XTwitterScraper::Models::CreditTopupBalanceParams

  Delivery = XTwitterScraper::Models::Delivery

  Draft = XTwitterScraper::Models::Draft

  DraftCreateParams = XTwitterScraper::Models::DraftCreateParams

  DraftDeleteParams = XTwitterScraper::Models::DraftDeleteParams

  DraftDetail = XTwitterScraper::Models::DraftDetail

  DraftListParams = XTwitterScraper::Models::DraftListParams

  DraftRetrieveParams = XTwitterScraper::Models::DraftRetrieveParams

  DrawDetail = XTwitterScraper::Models::DrawDetail

  DrawExportParams = XTwitterScraper::Models::DrawExportParams

  DrawListItem = XTwitterScraper::Models::DrawListItem

  DrawListParams = XTwitterScraper::Models::DrawListParams

  DrawRetrieveParams = XTwitterScraper::Models::DrawRetrieveParams

  DrawRunParams = XTwitterScraper::Models::DrawRunParams

  EmbeddedTweet = XTwitterScraper::Models::EmbeddedTweet

  Error = XTwitterScraper::Models::Error

  Event = XTwitterScraper::Models::Event

  EventDetail = XTwitterScraper::Models::EventDetail

  EventListParams = XTwitterScraper::Models::EventListParams

  EventRetrieveParams = XTwitterScraper::Models::EventRetrieveParams

  EventType = XTwitterScraper::Models::EventType

  ExtractionEstimateCostParams = XTwitterScraper::Models::ExtractionEstimateCostParams

  ExtractionExportResultsParams = XTwitterScraper::Models::ExtractionExportResultsParams

  ExtractionJob = XTwitterScraper::Models::ExtractionJob

  ExtractionListParams = XTwitterScraper::Models::ExtractionListParams

  ExtractionRetrieveParams = XTwitterScraper::Models::ExtractionRetrieveParams

  ExtractionRunParams = XTwitterScraper::Models::ExtractionRunParams

  GuestWalletAmount = XTwitterScraper::Models::GuestWalletAmount

  GuestWalletCreateParams = XTwitterScraper::Models::GuestWalletCreateParams

  GuestWalletRetrieveStatusParams = XTwitterScraper::Models::GuestWalletRetrieveStatusParams

  GuestWalletTopupParams = XTwitterScraper::Models::GuestWalletTopupParams

  Monitor = XTwitterScraper::Models::Monitor

  MonitorCreateParams = XTwitterScraper::Models::MonitorCreateParams

  MonitorDeactivateParams = XTwitterScraper::Models::MonitorDeactivateParams

  MonitorListParams = XTwitterScraper::Models::MonitorListParams

  MonitorRetrieveParams = XTwitterScraper::Models::MonitorRetrieveParams

  Monitors = XTwitterScraper::Models::Monitors

  MonitorUpdateParams = XTwitterScraper::Models::MonitorUpdateParams

  PaginatedTweets = XTwitterScraper::Models::PaginatedTweets

  PaginatedUsers = XTwitterScraper::Models::PaginatedUsers

  RadarItem = XTwitterScraper::Models::RadarItem

  RadarRetrieveTrendingTopicsParams = XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams

  SearchTweet = XTwitterScraper::Models::SearchTweet

  StyleAnalyzeParams = XTwitterScraper::Models::StyleAnalyzeParams

  StyleCompareParams = XTwitterScraper::Models::StyleCompareParams

  StyleDeleteParams = XTwitterScraper::Models::StyleDeleteParams

  StyleGetPerformanceParams = XTwitterScraper::Models::StyleGetPerformanceParams

  StyleListParams = XTwitterScraper::Models::StyleListParams

  StyleProfile = XTwitterScraper::Models::StyleProfile

  StyleProfileSummary = XTwitterScraper::Models::StyleProfileSummary

  StyleRetrieveParams = XTwitterScraper::Models::StyleRetrieveParams

  StyleUpdateParams = XTwitterScraper::Models::StyleUpdateParams

  SubscribeCreateParams = XTwitterScraper::Models::SubscribeCreateParams

  Support = XTwitterScraper::Models::Support

  TrendListParams = XTwitterScraper::Models::TrendListParams

  TweetMedia = XTwitterScraper::Models::TweetMedia

  UserProfile = XTwitterScraper::Models::UserProfile

  Webhook = XTwitterScraper::Models::Webhook

  WebhookCreateParams = XTwitterScraper::Models::WebhookCreateParams

  WebhookDeactivateParams = XTwitterScraper::Models::WebhookDeactivateParams

  WebhookListDeliveriesParams = XTwitterScraper::Models::WebhookListDeliveriesParams

  WebhookListParams = XTwitterScraper::Models::WebhookListParams

  WebhookResumeParams = XTwitterScraper::Models::WebhookResumeParams

  WebhookTestParams = XTwitterScraper::Models::WebhookTestParams

  WebhookUpdateParams = XTwitterScraper::Models::WebhookUpdateParams

  Winner = XTwitterScraper::Models::Winner

  X = XTwitterScraper::Models::X

  XGetArticleParams = XTwitterScraper::Models::XGetArticleParams

  XGetHomeTimelineParams = XTwitterScraper::Models::XGetHomeTimelineParams

  XGetNotificationsParams = XTwitterScraper::Models::XGetNotificationsParams

  XGetTrendsParams = XTwitterScraper::Models::XGetTrendsParams
end
