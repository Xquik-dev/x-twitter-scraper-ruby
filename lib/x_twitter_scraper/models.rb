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

  APIKeyCreateParams = XTwitterScraper::Models::APIKeyCreateParams

  APIKeyListParams = XTwitterScraper::Models::APIKeyListParams

  APIKeyRevokeParams = XTwitterScraper::Models::APIKeyRevokeParams

  Bot = XTwitterScraper::Models::Bot

  BotTrackUsageParams = XTwitterScraper::Models::BotTrackUsageParams

  ComposeCreateParams = XTwitterScraper::Models::ComposeCreateParams

  CreditRetrieveBalanceParams = XTwitterScraper::Models::CreditRetrieveBalanceParams

  CreditTopupBalanceParams = XTwitterScraper::Models::CreditTopupBalanceParams

  DraftCreateParams = XTwitterScraper::Models::DraftCreateParams

  DraftDeleteParams = XTwitterScraper::Models::DraftDeleteParams

  DraftListParams = XTwitterScraper::Models::DraftListParams

  DraftRetrieveParams = XTwitterScraper::Models::DraftRetrieveParams

  DrawExportParams = XTwitterScraper::Models::DrawExportParams

  DrawListParams = XTwitterScraper::Models::DrawListParams

  DrawRetrieveParams = XTwitterScraper::Models::DrawRetrieveParams

  DrawRunParams = XTwitterScraper::Models::DrawRunParams

  EventListParams = XTwitterScraper::Models::EventListParams

  EventRetrieveParams = XTwitterScraper::Models::EventRetrieveParams

  ExtractionEstimateCostParams = XTwitterScraper::Models::ExtractionEstimateCostParams

  ExtractionExportResultsParams = XTwitterScraper::Models::ExtractionExportResultsParams

  ExtractionListParams = XTwitterScraper::Models::ExtractionListParams

  ExtractionRetrieveParams = XTwitterScraper::Models::ExtractionRetrieveParams

  ExtractionRunParams = XTwitterScraper::Models::ExtractionRunParams

  IntegrationCreateParams = XTwitterScraper::Models::IntegrationCreateParams

  IntegrationDeleteParams = XTwitterScraper::Models::IntegrationDeleteParams

  IntegrationListDeliveriesParams = XTwitterScraper::Models::IntegrationListDeliveriesParams

  IntegrationListParams = XTwitterScraper::Models::IntegrationListParams

  IntegrationRetrieveParams = XTwitterScraper::Models::IntegrationRetrieveParams

  IntegrationSendTestParams = XTwitterScraper::Models::IntegrationSendTestParams

  IntegrationUpdateParams = XTwitterScraper::Models::IntegrationUpdateParams

  MonitorCreateParams = XTwitterScraper::Models::MonitorCreateParams

  MonitorDeactivateParams = XTwitterScraper::Models::MonitorDeactivateParams

  MonitorListParams = XTwitterScraper::Models::MonitorListParams

  MonitorRetrieveParams = XTwitterScraper::Models::MonitorRetrieveParams

  MonitorUpdateParams = XTwitterScraper::Models::MonitorUpdateParams

  RadarRetrieveTrendingTopicsParams = XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams

  StyleAnalyzeParams = XTwitterScraper::Models::StyleAnalyzeParams

  StyleCompareParams = XTwitterScraper::Models::StyleCompareParams

  StyleDeleteParams = XTwitterScraper::Models::StyleDeleteParams

  StyleGetPerformanceParams = XTwitterScraper::Models::StyleGetPerformanceParams

  StyleListParams = XTwitterScraper::Models::StyleListParams

  StyleRetrieveParams = XTwitterScraper::Models::StyleRetrieveParams

  StyleUpdateParams = XTwitterScraper::Models::StyleUpdateParams

  SubscribeCreateParams = XTwitterScraper::Models::SubscribeCreateParams

  Support = XTwitterScraper::Models::Support

  TrendListParams = XTwitterScraper::Models::TrendListParams

  WebhookCreateParams = XTwitterScraper::Models::WebhookCreateParams

  WebhookDeactivateParams = XTwitterScraper::Models::WebhookDeactivateParams

  WebhookListDeliveriesParams = XTwitterScraper::Models::WebhookListDeliveriesParams

  WebhookListParams = XTwitterScraper::Models::WebhookListParams

  WebhookTestParams = XTwitterScraper::Models::WebhookTestParams

  WebhookUpdateParams = XTwitterScraper::Models::WebhookUpdateParams

  X = XTwitterScraper::Models::X

  XGetArticleParams = XTwitterScraper::Models::XGetArticleParams

  XGetHomeTimelineParams = XTwitterScraper::Models::XGetHomeTimelineParams

  XGetNotificationsParams = XTwitterScraper::Models::XGetNotificationsParams

  XGetTrendsParams = XTwitterScraper::Models::XGetTrendsParams
end
