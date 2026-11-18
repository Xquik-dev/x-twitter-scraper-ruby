# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module Scaffold
  INTERNAL = "#{ROOT_MODULE}::Internal::Type".freeze

  class TypeText
    LIB_SCALARS = {
      string: "String",
      integer: "Integer",
      float: "Float",
      time: "Time",
      date: "Date",
      boolean: "#{INTERNAL}::Boolean",
      unknown: "#{INTERNAL}::Unknown"
    }.freeze
    YARD_SCALARS = {
      string: "String",
      integer: "Integer",
      float: "Float",
      time: "Time",
      date: "Date",
      boolean: "Boolean",
      unknown: "Object"
    }.freeze
    RBI_SCALARS = {
      string: "String",
      integer: "Integer",
      float: "Float",
      time: "Time",
      date: "Date",
      boolean: "T::Boolean",
      unknown: "T.anything"
    }.freeze
    RBS_SCALARS = {
      string: "String",
      integer: "Integer",
      float: "Float",
      time: "Time",
      date: "Date",
      boolean: "bool",
      unknown: "top"
    }.freeze

    def initialize(plans)
      @plans = plans
    end

    def symbol(value)
      value.match?(/\A[a-zA-Z_][a-zA-Z0-9_]*[?!]?\z/) ? ":#{value}" : ":#{value.to_s.dump}"
    end

    def lib_field(type)
      case type
      when Literal then "const: #{symbol(type.value)}"
      when Ref
        case type.kind
        when :enum then "enum: -> { #{type.constant} }"
        when :union then "union: -> { #{type.constant} }"
        else "-> { #{type.constant} }"
        end
      when List, Map then refers?(type) ? "-> { #{lib_inner(type)} }" : lib_inner(type)
      else LIB_SCALARS.fetch(type.name)
      end
    end

    def lib_inner(type)
      case type
      when Ref
        case type.kind
        when :enum then "enum: #{type.constant}"
        when :union then "union: #{type.constant}"
        else type.constant
        end
      when List then "#{INTERNAL}::ArrayOf[#{lib_inner(type.items)}]"
      when Map then "#{INTERNAL}::HashOf[#{lib_inner(type.values)}]"
      when Literal then raise PlanError, "A list of the constant #{type.value} has no Ruby type"
      else LIB_SCALARS.fetch(type.name)
      end
    end

    def lib_variant(type)
      case type
      when Ref
        case type.kind
        when :enum then "enum: -> { #{type.constant} }"
        when :union then "union: -> { #{type.constant} }"
        else "-> { #{type.constant} }"
        end
      else lib_field(type)
      end
    end

    def refers?(type)
      return refers?(type.items) if type.is_a?(List)
      return refers?(type.values) if type.is_a?(Map)

      type.is_a?(Ref)
    end

    def yard(type)
      case type
      when Literal then "Symbol, #{symbol(type.value)}"
      when Ref
        case type.kind
        when :enum then "Symbol, #{type.constant}"
        when :union then union_yard(type)
        else type.constant
        end
      when List then "Array<#{yard(type.items)}>"
      when Map then "Hash{Symbol=>#{yard(type.values)}}"
      else YARD_SCALARS.fetch(type.name)
      end
    end

    def union_yard(type)
      plan = @plans[type.constant]
      return type.constant unless plan

      plan.variants.map { yard(_1) }.uniq.join(", ")
    end

    def rbi_out(type)
      case type
      when Literal then "Symbol"
      when Ref
        case type.kind
        when :enum then "#{type.constant}::TaggedSymbol"
        when :union then "#{type.constant}::Variants"
        when :alias then rbi_out(@plans.fetch(type.constant).type)
        else type.constant
        end
      when List then "T::Array[#{rbi_out(type.items)}]"
      when Map then "T::Hash[Symbol, #{rbi_out(type.values)}]"
      else RBI_SCALARS.fetch(type.name)
      end
    end

    def rbi_in(type)
      case type
      when Literal then "Symbol"
      when Ref
        case type.kind
        when :enum then "#{type.constant}::OrSymbol"
        when :union then rbi_union_in(type)
        when :alias then rbi_in(@plans.fetch(type.constant).type)
        else "#{type.constant}::OrHash"
        end
      when List then "T::Array[#{rbi_in(type.items)}]"
      when Map then "T::Hash[Symbol, #{rbi_in(type.values)}]"
      else RBI_SCALARS.fetch(type.name)
      end
    end

    def rbi_union_in(type)
      plan = @plans[type.constant]
      return "#{type.constant}::Variants" unless plan

      "T.any(#{plan.variants.map { rbi_in(_1) }.uniq.join(', ')})"
    end

    def rbs(type)
      case type
      when Literal then symbol(type.value)
      when Ref
        case type.kind
        when :model then type.constant
        else "#{type.constant.rpartition('::').first}::#{Names.type_alias(type.constant)}"
        end
      when List then "::Array[#{rbs(type.items)}]"
      when Map then "::Hash[Symbol, #{rbs(type.values)}]"
      else RBS_SCALARS.fetch(type.name)
      end
    end

    def nilable_rbi(text, nullable) = nullable ? "T.nilable(#{text})" : text

    def nilable_rbs(text, nullable)
      return text unless nullable

      text.start_with?(":") ? "(#{text})?" : "#{text}?"
    end
  end
end
