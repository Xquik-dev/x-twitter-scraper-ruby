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

  APIKey = XTwitterScraper::Models::APIKey

  APIKeyCreateParams = XTwitterScraper::Models::APIKeyCreateParams

  APIKeyListParams = XTwitterScraper::Models::APIKeyListParams

  APIKeyRevokeParams = XTwitterScraper::Models::APIKeyRevokeParams

  ComposeCreateParams = XTwitterScraper::Models::ComposeCreateParams

  CreditRetrieveBalanceParams = XTwitterScraper::Models::CreditRetrieveBalanceParams

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

  Integration = XTwitterScraper::Models::Integration

  IntegrationCreateParams = XTwitterScraper::Models::IntegrationCreateParams

  IntegrationDeleteParams = XTwitterScraper::Models::IntegrationDeleteParams

  IntegrationDelivery = XTwitterScraper::Models::IntegrationDelivery

  IntegrationListDeliveriesParams = XTwitterScraper::Models::IntegrationListDeliveriesParams

  IntegrationListParams = XTwitterScraper::Models::IntegrationListParams

  IntegrationRetrieveParams = XTwitterScraper::Models::IntegrationRetrieveParams

  IntegrationSendTestParams = XTwitterScraper::Models::IntegrationSendTestParams

  IntegrationUpdateParams = XTwitterScraper::Models::IntegrationUpdateParams

  Monitor = XTwitterScraper::Models::Monitor

  MonitorCreateParams = XTwitterScraper::Models::MonitorCreateParams

  MonitorDeactivateParams = XTwitterScraper::Models::MonitorDeactivateParams

  MonitorListParams = XTwitterScraper::Models::MonitorListParams

  MonitorRetrieveParams = XTwitterScraper::Models::MonitorRetrieveParams

  MonitorUpdateParams = XTwitterScraper::Models::MonitorUpdateParams

  PaginatedTweets = XTwitterScraper::Models::PaginatedTweets

  PaginatedUsers = XTwitterScraper::Models::PaginatedUsers

  RadarItem = XTwitterScraper::Models::RadarItem

  RadarRetrieveTrendingTopicsParams = XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams

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

  Webhook = XTwitterScraper::Models::Webhook

  WebhookCreateParams = XTwitterScraper::Models::WebhookCreateParams

  WebhookDeactivateParams = XTwitterScraper::Models::WebhookDeactivateParams

  WebhookListDeliveriesParams = XTwitterScraper::Models::WebhookListDeliveriesParams

  WebhookListParams = XTwitterScraper::Models::WebhookListParams

  WebhookTestParams = XTwitterScraper::Models::WebhookTestParams

  WebhookUpdateParams = XTwitterScraper::Models::WebhookUpdateParams

  Winner = XTwitterScraper::Models::Winner

  X = XTwitterScraper::Models::X

  XGetArticleParams = XTwitterScraper::Models::XGetArticleParams

  XGetHomeTimelineParams = XTwitterScraper::Models::XGetHomeTimelineParams

  XGetNotificationsParams = XTwitterScraper::Models::XGetNotificationsParams

  XGetTrendsParams = XTwitterScraper::Models::XGetTrendsParams
end
