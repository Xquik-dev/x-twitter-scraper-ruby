# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "prism"
require "rbs"

module Scaffold
  class EditError < StandardError; end

  class Lines
    attr_reader :lines

    def initialize(source)
      @lines = source.lines(chomp: true)
    end

    def to_s = "#{@lines.join("\n")}\n"

    def replace(first, last, text)
      @lines[(first - 1)..(last - 1)] = text
    end

    def insert(line, text)
      @lines.insert(line - 1, *text)
    end

    def comment_start(line)
      line -= 1 while line > 1 && @lines[line - 2].match?(/\A\s*#/)
      line
    end
  end

  class RubyEdit
    def initialize(source, path)
      @path = path
      @lines = Lines.new(source)
    end

    def to_s = @lines.to_s

    def upsert_method(owner, name, text, anchor:, singleton: false)
      klass = find_class(owner)
      found = definition(klass, name, singleton)
      body = indent(klass, text)
      if found
        @lines.replace(region_start(klass, found), found.location.end_line, body)
      else
        target = definition(klass, anchor.fetch(:name), anchor.fetch(:singleton))
        raise EditError, "#{@path} has no #{anchor.fetch(:name)} in #{owner}" unless target

        @lines.insert(region_start(klass, target), [*body, ""])
      end
    end

    def upsert_attribute(owner, name, text)
      klass = find_class(owner)
      readers = statements(klass).select { attribute?(_1) }
      found = readers.find { _1.arguments.arguments.first.unescaped == name }
      body = indent(klass, text)
      if found
        @lines.replace(region_start(klass, found), found.location.end_line, body)
      elsif readers.empty?
        @lines.insert(klass.location.start_line + 1, [*body, ""])
      else
        @lines.insert(readers.last.location.end_line + 1, ["", *body])
      end
    end

    def upsert_assignment(owner, name, text)
      klass = find_class(owner)
      initializer = definition(klass, "initialize", false)
      raise EditError, "#{@path} has no initialize in #{owner}" unless initializer

      found = initializer.body.body.find { _1.is_a?(Prism::InstanceVariableWriteNode) && _1.name.to_s == "@#{name}" }
      pad = " " * (initializer.location.start_column + 2)
      if found
        @lines.replace(found.location.start_line, found.location.end_line, ["#{pad}#{text}"])
      else
        @lines.insert(initializer.location.end_line, ["#{pad}#{text}"])
      end
    end

    def upsert_constant(owner, name, text)
      klass = find_class(owner)
      constants = statements(klass).grep(Prism::ConstantWriteNode)
      found = constants.find { _1.name.to_s == name }
      body = indent(klass, text)
      return @lines.replace(found.location.start_line, found.location.end_line, body) if found

      after = constants.find { _1.name.to_s.casecmp(name).positive? }
      if after
        @lines.insert(after.location.start_line, [*body, ""])
      else
        @lines.insert(constants.last.location.end_line + 1, ["", *body])
      end
    end

    private

    def program
      result = Prism.parse(@lines.to_s)
      raise EditError, "#{@path} is not valid Ruby: #{result.errors.first.message}" unless result.errors.empty?

      result.value
    end

    def find_class(owner)
      owner.split("::").reduce(program) do |node, name|
        statements(node).find do |child|
          (child.is_a?(Prism::ClassNode) || child.is_a?(Prism::ModuleNode)) && child.constant_path.slice == name
        end || raise(EditError, "#{@path} has no #{owner}")
      end
    end

    def statements(node)
      body = node.is_a?(Prism::ProgramNode) ? node.statements : node.body
      body.is_a?(Prism::StatementsNode) ? body.body : []
    end

    def definition(klass, name, singleton)
      statements(klass).find do |child|
        child.is_a?(Prism::DefNode) && child.name.to_s == name && child.receiver.is_a?(Prism::SelfNode) == singleton
      end
    end

    def attribute?(node)
      node.is_a?(Prism::CallNode) && node.name == :attr_reader && node.receiver.nil? &&
        node.arguments&.arguments&.first.is_a?(Prism::SymbolNode)
    end

    def region_start(klass, node)
      children = statements(klass)
      index = children.index(node)
      previous = index&.positive? ? children[index - 1] : nil
      start = node.location.start_line
      start = previous.location.start_line if previous.is_a?(Prism::CallNode) && previous.name == :sig
      @lines.comment_start(start)
    end

    def indent(klass, text)
      pad = " " * (klass.location.start_column + 2)
      text.map { _1.empty? ? "" : "#{pad}#{_1}" }
    end
  end

  class RbsEdit
    def initialize(source, path)
      @path = path
      @lines = Lines.new(source)
    end

    def to_s = @lines.to_s

    def upsert_method(owner, name, text)
      decl = find_declaration(owner)
      found = decl.members.find { _1.is_a?(RBS::AST::Members::MethodDefinition) && _1.name.to_s == name }
      body = indent(decl, text)
      return @lines.replace(found.location.start_line, found.location.end_line, body) if found

      anchor = decl.members.find { _1.is_a?(RBS::AST::Members::MethodDefinition) && _1.name == :initialize }
      raise EditError, "#{@path} has no initialize in #{owner}" unless anchor

      @lines.insert(anchor.location.start_line, [*body, ""])
    end

    def upsert_attribute(owner, name, text)
      decl = find_declaration(owner)
      readers = decl.members.grep(RBS::AST::Members::AttrReader)
      found = readers.find { _1.name.to_s == name }
      body = indent(decl, text)
      if found
        @lines.replace(found.location.start_line, found.location.end_line, body)
      elsif readers.empty?
        @lines.insert(decl.location.start_line + 1, [*body, ""])
      else
        @lines.insert(readers.last.location.end_line + 1, ["", *body])
      end
    end

    def upsert_alias(owner, name, text)
      decl = find_declaration(owner)
      aliases = decl.members.select { alias?(_1) }
      found = aliases.find { _1.new_name.name.to_s == name }
      body = indent(decl, text)
      return @lines.replace(found.location.start_line, found.location.end_line, body) if found

      after = aliases.find { _1.new_name.name.to_s.casecmp(name).positive? }
      if after
        @lines.insert(after.location.start_line, [*body, ""])
      else
        @lines.insert(aliases.last.location.end_line + 1, ["", *body])
      end
    end

    private

    def alias?(member)
      member.is_a?(RBS::AST::Declarations::ClassAlias) || member.is_a?(RBS::AST::Declarations::ModuleAlias)
    end

    def find_declaration(owner)
      _, _, declarations = RBS::Parser.parse_signature(@lines.to_s)
      owner.split("::").reduce(declarations) do |members, name|
        found = members.find do |member|
          (member.is_a?(RBS::AST::Declarations::Class) || member.is_a?(RBS::AST::Declarations::Module)) &&
            member.name.name.to_s == name
        end
        raise EditError, "#{@path} has no #{owner}" unless found

        name == owner.split("::").last ? (return found) : found.members
      end
    end

    def indent(decl, text)
      pad = " " * (decl.location.start_column + 2)
      text.map { _1.empty? ? "" : "#{pad}#{_1}" }
    end
  end

  class RequireEdit
    def initialize(source)
      @lines = Lines.new(source)
    end

    def to_s = @lines.to_s

    def ensure(path)
      line = "require_relative #{path.dump}"
      return if @lines.lines.include?(line)

      kind = path[%r{\Ax_twitter_scraper/[a-z_]+/}]
      same = @lines.lines.each_index.select { @lines.lines[_1].start_with?("require_relative #{kind.dump[0...-1]}") }
      raise EditError, "lib/x_twitter_scraper.rb requires nothing under #{kind}" if same.empty?

      run = sorted_tail(same)
      after = run.find { @lines.lines[_1] > line }
      @lines.lines.insert(after || (same.last + 1), line)
    end

    private

    def sorted_tail(indices)
      start = indices.length - 1
      start -= 1 while start.positive? && @lines.lines[indices[start - 1]] <= @lines.lines[indices[start]]
      indices[start..]
    end
  end
end
