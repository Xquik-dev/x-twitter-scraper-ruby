# frozen_string_literal: true

require_relative "../../test_helper"

class XTwitterScraper::Test::Resources::X::ProfileTest < XTwitterScraper::Test::ResourceTest
  def test_patch_all_required_params
    skip("Mock server tests are disabled")

    response = @x_twitter_scraper.x.profile.patch_all(account: "account")

    assert_pattern do
      response => XTwitterScraper::Models::X::ProfilePatchAllResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_update_avatar_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.profile.update_avatar(account: "account", file: StringIO.new("Example data"))

    assert_pattern do
      response => XTwitterScraper::Models::X::ProfileUpdateAvatarResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_update_banner_required_params
    skip("Mock server tests are disabled")

    response =
      @x_twitter_scraper.x.profile.update_banner(account: "account", file: StringIO.new("Example data"))

    assert_pattern do
      response => XTwitterScraper::Models::X::ProfileUpdateBannerResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end
end
