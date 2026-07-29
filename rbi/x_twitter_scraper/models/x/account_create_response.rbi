# typed: strong

module XTwitterScraper
  module Models
    module X
      AccountCreateResponse =
        T.let(T.anything, XTwitterScraper::Internal::Type::Converter)
    end
  end
end
