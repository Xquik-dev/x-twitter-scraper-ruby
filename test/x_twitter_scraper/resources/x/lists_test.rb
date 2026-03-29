# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::ListsTest < XTwitterScraper::Test::ResourceTest
  def test_retrieve_followers
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.lists.retrieve_followers("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_members
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.lists.retrieve_members("id")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_tweets
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.lists.retrieve_tweets("id")

    assert_pattern do
      response => nil
    end
  end
end
