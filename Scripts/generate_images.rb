#!/usr/bin/env ruby

require_relative "assets/image/images_assets_file"
require_relative "assets/image/swift_image_extension_generator"
require_relative "assets/utils/keys_graph"

module_name = ARGV[0]
input_images_file = ARGV[1]
output_swift_file = ARGV[2]

keys = ImagesAssetsFile.new(input_images_file).read_keys
graph = KeysGraph.new(module_name, keys)
SwiftImageExtensionGenerator.new.generate_extension(output_swift_file, graph.root)
