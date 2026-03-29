# typed: strong

module XTwitterScraper
  module Models
    ComposeCreateResponse =
      T.let(
        XTwitterScraper::Internal::Type::HashOf[
          XTwitterScraper::Internal::Type::Unknown
        ],
        XTwitterScraper::Internal::Type::Converter
      )
  end
end
