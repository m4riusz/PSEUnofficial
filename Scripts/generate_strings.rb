#!/usr/bin/env ruby

require_relative "assets/string/strings_assets_file"
require_relative "assets/string/swift_string_extension_generator"
require_relative "assets/utils/keys_graph"

module_name = ARGV[0]
input_strings_file = ARGV[1]
output_swift_file = ARGV[2]

keys = StringsAssetsFile.new(input_strings_file).read_keys
graph = KeysGraph.new(module_name, keys)
SwiftStringExtensionGenerator.new.generate_extension(output_swift_file, graph.root)
