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

  AccountBasedIn = XTwitterScraper::Models::AccountBasedIn

  AccountRetrieveParams = XTwitterScraper::Models::AccountRetrieveParams

  AccountSetXUsernameParams = XTwitterScraper::Models::AccountSetXUsernameParams

  AccountUpdateLocaleParams = XTwitterScraper::Models::AccountUpdateLocaleParams

  ActivityExportParams = XTwitterScraper::Models::ActivityExportParams

  ActivityListParams = XTwitterScraper::Models::ActivityListParams

  ActivityLogRow = XTwitterScraper::Models::ActivityLogRow

  ActivityRecord = XTwitterScraper::Models::ActivityRecord

  ActivityRetrieveParams = XTwitterScraper::Models::ActivityRetrieveParams

  AuditedFollower = XTwitterScraper::Models::AuditedFollower

  BatchUserTweets = XTwitterScraper::Models::BatchUserTweets

  Broadcast = XTwitterScraper::Models::Broadcast

  Community = XTwitterScraper::Models::Community

  CommunityAnalytics = XTwitterScraper::Models::CommunityAnalytics

  CommunityAnalyticsMetric = XTwitterScraper::Models::CommunityAnalyticsMetric

  CommunityBanner = XTwitterScraper::Models::CommunityBanner

  CommunityMemberPreview = XTwitterScraper::Models::CommunityMemberPreview

  CommunityNote = XTwitterScraper::Models::CommunityNote

  CommunityNoteEntity = XTwitterScraper::Models::CommunityNoteEntity

  CommunityNotesContributor = XTwitterScraper::Models::CommunityNotesContributor

  CommunityNotesNoteCounts = XTwitterScraper::Models::CommunityNotesNoteCounts

  CommunityNotesRatingCounts = XTwitterScraper::Models::CommunityNotesRatingCounts

  CommunityNotesRatingOutcome = XTwitterScraper::Models::CommunityNotesRatingOutcome

  CommunityPage = XTwitterScraper::Models::CommunityPage

  CommunityTopic = XTwitterScraper::Models::CommunityTopic

  ComposeCreateParams = XTwitterScraper::Models::ComposeCreateParams

  ContentDisclosure = XTwitterScraper::Models::ContentDisclosure

  CoverageEndReason = XTwitterScraper::Models::CoverageEndReason

  CreditRedirectTopupCheckoutParams = XTwitterScraper::Models::CreditRedirectTopupCheckoutParams

  CreditRetrieveBalanceParams = XTwitterScraper::Models::CreditRetrieveBalanceParams

  CreditRetrieveTopupStatusParams = XTwitterScraper::Models::CreditRetrieveTopupStatusParams

  CreditTopupBalanceParams = XTwitterScraper::Models::CreditTopupBalanceParams

  Currency = XTwitterScraper::Models::Currency

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

  EventStreamParams = XTwitterScraper::Models::EventStreamParams

  EventType = XTwitterScraper::Models::EventType

  ExtractionCancelParams = XTwitterScraper::Models::ExtractionCancelParams

  ExtractionEstimateCostParams = XTwitterScraper::Models::ExtractionEstimateCostParams

  ExtractionExportResultsParams = XTwitterScraper::Models::ExtractionExportResultsParams

  ExtractionJob = XTwitterScraper::Models::ExtractionJob

  ExtractionListParams = XTwitterScraper::Models::ExtractionListParams

  ExtractionRetrieveParams = XTwitterScraper::Models::ExtractionRetrieveParams

  ExtractionRunParams = XTwitterScraper::Models::ExtractionRunParams

  FollowerAudit = XTwitterScraper::Models::FollowerAudit

  FollowerClass = XTwitterScraper::Models::FollowerClass

  FollowerValueCount = XTwitterScraper::Models::FollowerValueCount

  FootballBoxScore = XTwitterScraper::Models::FootballBoxScore

  FootballDrive = XTwitterScraper::Models::FootballDrive

  FootballFumbleStats = XTwitterScraper::Models::FootballFumbleStats

  FootballOdds = XTwitterScraper::Models::FootballOdds

  FootballPassingStats = XTwitterScraper::Models::FootballPassingStats

  FootballPeriod = XTwitterScraper::Models::FootballPeriod

  FootballPlay = XTwitterScraper::Models::FootballPlay

  FootballPlayDetail = XTwitterScraper::Models::FootballPlayDetail

  FootballPlayer = XTwitterScraper::Models::FootballPlayer

  FootballPlayerProp = XTwitterScraper::Models::FootballPlayerProp

  FootballPlayerStats = XTwitterScraper::Models::FootballPlayerStats

  FootballPlays = XTwitterScraper::Models::FootballPlays

  FootballPropCategory = XTwitterScraper::Models::FootballPropCategory

  FootballProps = XTwitterScraper::Models::FootballProps

  FootballQuarter = XTwitterScraper::Models::FootballQuarter

  FootballReturnStats = XTwitterScraper::Models::FootballReturnStats

  FootballRoster = XTwitterScraper::Models::FootballRoster

  FootballRosterTeam = XTwitterScraper::Models::FootballRosterTeam

  FootballRushingStats = XTwitterScraper::Models::FootballRushingStats

  FootballSchedule = XTwitterScraper::Models::FootballSchedule

  FootballScheduleGame = XTwitterScraper::Models::FootballScheduleGame

  FootballSchedulePeriod = XTwitterScraper::Models::FootballSchedulePeriod

  FootballScoreboard = XTwitterScraper::Models::FootballScoreboard

  FootballSide = XTwitterScraper::Models::FootballSide

  FootballTeamBox = XTwitterScraper::Models::FootballTeamBox

  FootballTeamScore = XTwitterScraper::Models::FootballTeamScore

  FootballTeamTotals = XTwitterScraper::Models::FootballTeamTotals

  GuestWalletAmount = XTwitterScraper::Models::GuestWalletAmount

  GuestWalletCreateParams = XTwitterScraper::Models::GuestWalletCreateParams

  GuestWalletRetrieveStatusParams = XTwitterScraper::Models::GuestWalletRetrieveStatusParams

  GuestWalletTopupParams = XTwitterScraper::Models::GuestWalletTopupParams

  Hashflag = XTwitterScraper::Models::Hashflag

  ImageFilterSummary = XTwitterScraper::Models::ImageFilterSummary

  ImageFilteredTweets = XTwitterScraper::Models::ImageFilteredTweets

  Job = XTwitterScraper::Models::Job

  JobAccount = XTwitterScraper::Models::JobAccount

  JobCompany = XTwitterScraper::Models::JobCompany

  JobLocation = XTwitterScraper::Models::JobLocation

  JobLocations = XTwitterScraper::Models::JobLocations

  Monitor = XTwitterScraper::Models::Monitor

  MonitorCreateParams = XTwitterScraper::Models::MonitorCreateParams

  MonitorDeactivateParams = XTwitterScraper::Models::MonitorDeactivateParams

  MonitorListParams = XTwitterScraper::Models::MonitorListParams

  MonitorRetrieveParams = XTwitterScraper::Models::MonitorRetrieveParams

  Monitors = XTwitterScraper::Models::Monitors

  MonitorUpdateParams = XTwitterScraper::Models::MonitorUpdateParams

  MonitorUpsertByUsernameParams = XTwitterScraper::Models::MonitorUpsertByUsernameParams

  NewsVersion = XTwitterScraper::Models::NewsVersion

  PaginatedCommunityNotes = XTwitterScraper::Models::PaginatedCommunityNotes

  PaginatedJobs = XTwitterScraper::Models::PaginatedJobs

  PaginatedLists = XTwitterScraper::Models::PaginatedLists

  PaginatedTweets = XTwitterScraper::Models::PaginatedTweets

  PaginatedUserIds = XTwitterScraper::Models::PaginatedUserIds

  PaginatedUsers = XTwitterScraper::Models::PaginatedUsers

  Place = XTwitterScraper::Models::Place

  PlaceSearchResult = XTwitterScraper::Models::PlaceSearchResult

  PostEngagementMetrics = XTwitterScraper::Models::PostEngagementMetrics

  PostEventType = XTwitterScraper::Models::PostEventType

  PostMetricPoint = XTwitterScraper::Models::PostMetricPoint

  PostMetricReading = XTwitterScraper::Models::PostMetricReading

  PostMetrics = XTwitterScraper::Models::PostMetrics

  PostMonitor = XTwitterScraper::Models::PostMonitor

  PostMonitorMetrics = XTwitterScraper::Models::PostMonitorMetrics

  ProfileContactInfo = XTwitterScraper::Models::ProfileContactInfo

  ProfileTranslation = XTwitterScraper::Models::ProfileTranslation

  RadarItem = XTwitterScraper::Models::RadarItem

  RadarRetrieveTrendingTopicsParams = XTwitterScraper::Models::RadarRetrieveTrendingTopicsParams

  ReplyTweet = XTwitterScraper::Models::ReplyTweet

  ResolvedLink = XTwitterScraper::Models::ResolvedLink

  SearchSuggestionCashtag = XTwitterScraper::Models::SearchSuggestionCashtag

  SearchSuggestionHashtag = XTwitterScraper::Models::SearchSuggestionHashtag

  SearchSuggestions = XTwitterScraper::Models::SearchSuggestions

  SearchSuggestionTopic = XTwitterScraper::Models::SearchSuggestionTopic

  SearchSuggestionUser = XTwitterScraper::Models::SearchSuggestionUser

  SearchTweet = XTwitterScraper::Models::SearchTweet

  ShadowbanReport = XTwitterScraper::Models::ShadowbanReport

  ShadowbanVerdict = XTwitterScraper::Models::ShadowbanVerdict

  Space = XTwitterScraper::Models::Space

  SpaceParticipant = XTwitterScraper::Models::SpaceParticipant

  SpaceSharing = XTwitterScraper::Models::SpaceSharing

  SportsGameAudience = XTwitterScraper::Models::SportsGameAudience

  SportsGamePosts = XTwitterScraper::Models::SportsGamePosts

  SportsTeam = XTwitterScraper::Models::SportsTeam

  SportsTeamGame = XTwitterScraper::Models::SportsTeamGame

  StreamEventType = XTwitterScraper::Models::StreamEventType

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

  SubtitleTrack = XTwitterScraper::Models::SubtitleTrack

  Support = XTwitterScraper::Models::Support

  TopicFilterSummary = XTwitterScraper::Models::TopicFilterSummary

  TopicFilteredTweets = XTwitterScraper::Models::TopicFilteredTweets

  TrendListParams = XTwitterScraper::Models::TrendListParams

  TrendLocation = XTwitterScraper::Models::TrendLocation

  TweetAnalysisPage = XTwitterScraper::Models::TweetAnalysisPage

  TweetAuthorUnavailable = XTwitterScraper::Models::TweetAuthorUnavailable

  TweetEmbed = XTwitterScraper::Models::TweetEmbed

  TweetEntities = XTwitterScraper::Models::TweetEntities

  TweetExclusiveContent = XTwitterScraper::Models::TweetExclusiveContent

  TweetHashtag = XTwitterScraper::Models::TweetHashtag

  TweetInsights = XTwitterScraper::Models::TweetInsights

  TweetInterstitial = XTwitterScraper::Models::TweetInterstitial

  TweetMedia = XTwitterScraper::Models::TweetMedia

  TweetPoint = XTwitterScraper::Models::TweetPoint

  TweetSmartTag = XTwitterScraper::Models::TweetSmartTag

  TweetSubscriberBadge = XTwitterScraper::Models::TweetSubscriberBadge

  TweetSubtitles = XTwitterScraper::Models::TweetSubtitles

  TweetSymbol = XTwitterScraper::Models::TweetSymbol

  TweetTombstone = XTwitterScraper::Models::TweetTombstone

  TweetTranslation = XTwitterScraper::Models::TweetTranslation

  TweetUrlEntity = XTwitterScraper::Models::TweetUrlEntity

  TweetUserMention = XTwitterScraper::Models::TweetUserMention

  UserAffiliateLabel = XTwitterScraper::Models::UserAffiliateLabel

  UserAuxiliaryLabel = XTwitterScraper::Models::UserAuxiliaryLabel

  UserHighlightsInfo = XTwitterScraper::Models::UserHighlightsInfo

  UserIdentityVerification = XTwitterScraper::Models::UserIdentityVerification

  UserInsights = XTwitterScraper::Models::UserInsights

  UserListPage = XTwitterScraper::Models::UserListPage

  UserLiveStatus = XTwitterScraper::Models::UserLiveStatus

  UserProfile = XTwitterScraper::Models::UserProfile

  UserTipJar = XTwitterScraper::Models::UserTipJar

  Webhook = XTwitterScraper::Models::Webhook

  WebhookCreateParams = XTwitterScraper::Models::WebhookCreateParams

  WebhookCreateTelegramLinkParams = XTwitterScraper::Models::WebhookCreateTelegramLinkParams

  WebhookDeactivateParams = XTwitterScraper::Models::WebhookDeactivateParams

  WebhookListDeliveriesParams = XTwitterScraper::Models::WebhookListDeliveriesParams

  WebhookListParams = XTwitterScraper::Models::WebhookListParams

  WebhookResumeParams = XTwitterScraper::Models::WebhookResumeParams

  WebhookTestParams = XTwitterScraper::Models::WebhookTestParams

  WebhookUpdateParams = XTwitterScraper::Models::WebhookUpdateParams

  Winner = XTwitterScraper::Models::Winner

  X = XTwitterScraper::Models::X

  XAutocompleteSearchParams = XTwitterScraper::Models::XAutocompleteSearchParams

  XGetArticleParams = XTwitterScraper::Models::XGetArticleParams

  XGetHashflagsParams = XTwitterScraper::Models::XGetHashflagsParams

  XGetHomeTimelineParams = XTwitterScraper::Models::XGetHomeTimelineParams

  XGetNewsStoryVersionsParams = XTwitterScraper::Models::XGetNewsStoryVersionsParams

  XGetNotificationsParams = XTwitterScraper::Models::XGetNotificationsParams

  XGetTrendLocationsParams = XTwitterScraper::Models::XGetTrendLocationsParams

  XGetTrendsHistoryParams = XTwitterScraper::Models::XGetTrendsHistoryParams

  XGetTrendsParams = XTwitterScraper::Models::XGetTrendsParams

  XList = XTwitterScraper::Models::XList

  XListBanner = XTwitterScraper::Models::XListBanner

  XSearchPlacesParams = XTwitterScraper::Models::XSearchPlacesParams
end
