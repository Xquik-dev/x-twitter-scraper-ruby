# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "rubocop"

module RuboCop
  module Cop
    module Xquik
      class NoCodeComments < Base
        MSG = "Code has no comments. Put the meaning in names, types and tests."
        PROOF = %r{https://|SPDX-|REUSE-Ignore}
        DIRECTIVE = /\A#(?:!|\s*(?:rubocop:|:nocov:|steep:|(?:frozen_string_literal|typed|encoding|shareable_constant_value|warn_indent):))/
        YARD_DIRECTIVE = /\A#\s*@!/
        BODIES = [:def, :defs].freeze
        PARAMETERS = [:arg, :optarg, :restarg, :kwarg, :kwoptarg, :kwrestarg, :blockarg].freeze

        def on_new_investigation
          public_file = public_api_file?
          blocks(processed_source.comments).each do |block|
            documented = public_file && documents_public_api?(block)
            block.each_with_index do |comment, index|
              next if documented || DIRECTIVE.match?(comment.text) || block.drop(index).any? { PROOF.match?(_1.text) }

              add_offense(comment.source_range)
            end
          end
        end

        private

        def blocks(comments)
          comments.slice_when { |earlier, later| !adjacent?(earlier, later) }.to_a
        end

        def adjacent?(earlier, later)
          between = processed_source.buffer.source[earlier.source_range.end_pos...later.source_range.begin_pos]
          between.strip.empty? && between.count("\n") <= 1
        end

        def public_api_file?
          relative = relative_path
          matches?(cop_config["PublicApiDocs"], relative) && !matches?(cop_config["PrivateApi"], relative)
        end

        def relative_path
          path = processed_source.file_path.to_s
          base = "#{config.base_dir_for_path_parameters}/"
          path.start_with?(base) ? path.delete_prefix(base) : path
        end

        def matches?(patterns, path)
          Array(patterns).any? { File.fnmatch?(_1, path, File::FNM_PATHNAME | File::FNM_EXTGLOB) }
        end

        def documents_public_api?(block)
          return true if YARD_DIRECTIVE.match?(block.first.text)

          node = declaration_after(block.last)
          return false if node.nil?

          PARAMETERS.include?(node.type) || node.each_ancestor.none? { BODIES.include?(_1.type) }
        end

        def declaration_after(comment)
          ast = processed_source.ast
          return if ast.nil?

          token = processed_source.tokens.find { _1.pos.begin_pos >= comment.source_range.end_pos && !_1.comment? }
          return if token.nil? || token.line != comment.loc.line + 1

          [ast, *ast.each_descendant].select { _1.source_range&.begin_pos == token.pos.begin_pos }.max_by { _1.source_range.size }
        end
      end
    end
  end
end
