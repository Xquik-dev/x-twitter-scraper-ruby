# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::BookmarksTest < XTwitterScraper::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.bookmarks.list

    assert_pattern do
      response => XTwitterScraper::PaginatedTweets
    end

    assert_pattern do
      response => {
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String,
        tweets: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::X::SearchTweet])
      }
    end
  end

  def test_retrieve_folders
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.bookmarks.retrieve_folders

    assert_pattern do
      response => XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse
    end

    assert_pattern do
      response => {
        folders: ^(XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::BookmarkRetrieveFoldersResponse::Folder]),
        has_next_page: XTwitterScraper::Internal::Type::Boolean,
        next_cursor: String
      }
    end
  end
end
