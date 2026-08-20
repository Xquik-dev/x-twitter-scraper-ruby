# frozen_string_literal: true

require "yaml"

target(:lib) do
  configure_code_diagnostics(Steep::Diagnostic::Ruby.strict)

  signature("sig")

  YAML.safe_load_file("./manifest.yaml", symbolize_names: true) => {dependencies:}
  # Exclude standard libraries without the RBS annotations Steep needs.
  stdlibs = dependencies - %w[English etc net/http rbconfig set stringio]

  stdlibs.each { library(_1) }
end
