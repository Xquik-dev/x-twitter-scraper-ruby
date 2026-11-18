# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require "fileutils"
require "json"
require "open3"
require "tmpdir"

require_relative "check_api_fields"
require_relative "scaffold/plan"
require_relative "scaffold/types"
require_relative "scaffold/models"
require_relative "scaffold/resources"
require_relative "scaffold/tests"
require_relative "scaffold/edit"

module Scaffold
  TABLE = File.join(__dir__, "scaffold", "operations.json")
  REGISTRY = "lib/x_twitter_scraper.rb"
  ALIASES = {
    lib: "lib/x_twitter_scraper/models.rb",
    rbi: "rbi/x_twitter_scraper/models.rbi",
    rbs: "sig/x_twitter_scraper/models.rbs"
  }.freeze

  class Run
    attr_reader :changed

    def initialize(document, root:, table: JSON.parse(File.read(TABLE)), format: true)
      @root = root
      @format = format
      @planner = Planner.new(document, table)
      @operations = @planner.operations
      @plans = [*@planner.files, *@operations.map(&:params)]
      @index = index(@plans)
      @types = TypeText.new(@index)
      @models = ModelText.new(@types)
      @methods = MethodText.new(@types)
      @tests = TestText.new(@types, @index)
      @files = {}
    end

    def call
      before = {}
      write_models
      write_resources
      write_registries
      write_tests
      @files.each do |path, content|
        full = File.join(@root, path)
        before[path] = File.exist?(full) ? File.binread(full) : nil
        FileUtils.mkdir_p(File.dirname(full))
        File.write(full, content)
      end
      format(@files.keys) if @format
      @changed = @files.keys.reject { before[_1] == File.binread(File.join(@root, _1)) }.sort
      self
    end

    private

    def index(plans)
      plans.each_with_object({}) do |plan, all|
        all[plan.constant] = plan
        index(plan.nested).each { |constant, nested| all[constant] = nested } if plan.respond_to?(:nested)
      end
    end

    def read(path) = @files.fetch(path) { File.read(File.join(@root, path)) }

    def relative(constant, base)
      constant.delete_prefix("#{base}::").split("::").map { Names.snake(_1) }.join("/")
    end

    def write_models
      @plans.each do |plan|
        path = relative(plan.constant, MODELS)
        @files["lib/x_twitter_scraper/models/#{path}.rb"] = @models.lib(plan)
        @files["rbi/x_twitter_scraper/models/#{path}.rbi"] = @models.rbi(plan)
        @files["sig/x_twitter_scraper/models/#{path}.rbs"] = @models.rbs(plan)
      end
    end

    def resources
      @operations.group_by(&:resource)
    end

    def owned?(resource, operations)
      constant = @methods.resource_constant(resource)
      return true unless Object.const_defined?(constant)

      children = resources.keys.select { _1[...-1] == resource }.map(&:last)
      (Object.const_get(constant).instance_methods(false).map(&:to_s) - operations.map(&:name) - children).empty?
    end

    def write_resources
      groups = resources
      owned = groups.select { |resource, operations| owned?(resource, operations) }.keys.to_set
      groups.each do |resource, operations|
        constant = @methods.resource_constant(resource)
        path = resource.join("/")
        children = groups.keys.select { owned.include?(_1) && _1[...-1] == resource }.map { @methods.resource_constant(_1) }
        if owned.include?(resource)
          @files["lib/x_twitter_scraper/resources/#{path}.rb"] = @methods.resource_lib(constant, operations, children)
          @files["rbi/x_twitter_scraper/resources/#{path}.rbi"] = @methods.resource_rbi(constant, operations, children)
          @files["sig/x_twitter_scraper/resources/#{path}.rbs"] = @methods.resource_rbs(constant, operations, children)
          attach(resource, constant) unless owned.include?(resource[...-1])
        else
          extend_resource(constant, path, operations)
        end
      end
    end

    def extend_resource(constant, path, operations)
      lib = RubyEdit.new(read("lib/x_twitter_scraper/resources/#{path}.rb"), path)
      rbi = RubyEdit.new(read("rbi/x_twitter_scraper/resources/#{path}.rbi"), path)
      rbs = RbsEdit.new(read("sig/x_twitter_scraper/resources/#{path}.rbs"), path)
      operations.each do |operation|
        lib.upsert_method(
          constant,
          operation.name,
          @methods.lib(operation),
          anchor: {name: "initialize", singleton: false}
        )
        rbi.upsert_method(constant, operation.name, @methods.rbi(operation), anchor: {name: "new", singleton: true})
        rbs.upsert_method(constant, operation.name, @methods.rbs(operation))
      end
      @files["lib/x_twitter_scraper/resources/#{path}.rb"] = lib.to_s
      @files["rbi/x_twitter_scraper/resources/#{path}.rbi"] = rbi.to_s
      @files["sig/x_twitter_scraper/resources/#{path}.rbs"] = rbs.to_s
    end

    def attach(resource, child)
      parent = resource.length == 1 ? CLIENT : @methods.resource_constant(resource[...-1])
      path = resource.length == 1 ? "client" : "resources/#{resource[...-1].join('/')}"
      name = resource.last
      lib = RubyEdit.new(read("lib/x_twitter_scraper/#{path}.rb"), path)
      lib.upsert_attribute(parent, name, @methods.accessor_lib(child))
      lib.upsert_assignment(parent, name, @methods.assignment(child, parent))
      rbi = RubyEdit.new(read("rbi/x_twitter_scraper/#{path}.rbi"), path)
      rbi.upsert_attribute(parent, name, @methods.accessor_rbi(child))
      rbs = RbsEdit.new(read("sig/x_twitter_scraper/#{path}.rbs"), path)
      rbs.upsert_attribute(parent, name, @methods.accessor_rbs(child))
      @files["lib/x_twitter_scraper/#{path}.rb"] = lib.to_s
      @files["rbi/x_twitter_scraper/#{path}.rbi"] = rbi.to_s
      @files["sig/x_twitter_scraper/#{path}.rbs"] = rbs.to_s
    end

    def write_registries
      requires = RequireEdit.new(read(REGISTRY))
      @files.keys.grep(%r{\Alib/x_twitter_scraper/(models|resources)/.+\.rb\z}).sort.each do |path|
        requires.ensure(path.delete_prefix("lib/").delete_suffix(".rb"))
      end
      @files[REGISTRY] = requires.to_s
      lib = RubyEdit.new(read(ALIASES[:lib]), ALIASES[:lib])
      rbi = RubyEdit.new(read(ALIASES[:rbi]), ALIASES[:rbi])
      rbs = RbsEdit.new(read(ALIASES[:rbs]), ALIASES[:rbs])
      @plans.select { aliased?(_1) }.sort_by(&:constant).each do |plan|
        name = Text.short(plan.constant)
        lib.upsert_constant(ROOT_MODULE, name, ["#{name} = #{plan.constant}"])
        rbi.upsert_constant(ROOT_MODULE, name, ["#{name} = #{plan.constant}"])
        keyword = plan.is_a?(Model) || plan.is_a?(Params) ? "class" : "module"
        rbs.upsert_alias(ROOT_MODULE, name, ["#{keyword} #{name} = #{plan.constant}"])
      end
      @files[ALIASES[:lib]] = lib.to_s
      @files[ALIASES[:rbi]] = rbi.to_s
      @files[ALIASES[:rbs]] = rbs.to_s
    end

    def aliased?(plan)
      plan.constant.split("::").length == 3 && (plan.is_a?(Params) || !plan.respond_to?(:see) || plan.see.nil?)
    end

    def write_tests
      resources.each { |resource, operations| @files[@tests.path(resource)] = @tests.render(resource, operations) }
    end

    def format(paths)
      Dir.mktmpdir do |directory|
        list = File.join(directory, "files")
        File.write(list, paths.map { File.join(".", _1) }.join("\n") << "\n")
        output, status = Open3.capture2e({"FORMAT_FILE" => list}, *%w[bundle exec rake format], chdir: @root)
        raise EditError, "rake format failed:\n#{output}" unless status.success?
      end
    end
  end

  module_function

  def main(source: ApiFieldsCheck.spec_source, root: ApiFieldsCheck::ROOT)
    document = ApiFieldsCheck.load_spec(source)
    run = Run.new(document, root: root).call
    puts("The scaffolder changed #{run.changed.length} files.")
    run.changed.each { puts("  #{_1}") }
    0
  rescue ApiFieldsCheck::Failure => e
    warn(e.lines.join("\n"))
    1
  rescue PlanError, EditError => e
    warn("#{e.message}. Fix scripts/scaffold/operations.json or the scaffolder, then rerun it.")
    1
  end
end

exit(Scaffold.main) if $PROGRAM_NAME == __FILE__
