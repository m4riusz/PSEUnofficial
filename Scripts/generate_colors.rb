#!/usr/bin/env ruby

require_relative "assets/color/colors_assets_file"
require_relative "assets/color/swift_color_extension_generator"
require_relative "assets/utils/keys_graph"

module_name = ARGV[0]
input_color_file = ARGV[1]
output_swift_file = ARGV[2]

keys = ColorsAssetsFile.new(input_color_file).read_keys
graph = KeysGraph.new(module_name, keys)
SwiftColorExtensionGenerator.new.generate_extension(output_swift_file, graph.root)
