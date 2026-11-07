# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "test_helper"

class XTwitterScraperExtractionToolTypesTest < Minitest::Test
  def test_every_tool_type_takes_user_affiliates
    [
      XTwitterScraper::Models::ExtractionJob::ToolType,
      XTwitterScraper::Models::ExtractionListParams::ToolType,
      XTwitterScraper::Models::ExtractionEstimateCostParams::ToolType,
      XTwitterScraper::Models::ExtractionRunParams::ToolType
    ].each do |tool_type|
      assert_includes(tool_type.values, :user_affiliates)
    end
  end
end
